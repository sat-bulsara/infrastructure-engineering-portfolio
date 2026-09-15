# Project 17 Completion Guide

## Linux VM Administration and Secure Access

This guide is designed to let the project be completed without a live tutor.
Work through one checkpoint at a time and keep the environment disposable.

The company, people and workload in this project are simulated. Treat the
engineering decisions, security controls, evidence and operational process as
real.

## 1. Company brief

Cedar & Finch Legal is a 140-person UK legal-services company. Its operations
team needs a small Linux host to process internal document-indexing jobs. The
service is not intended for public use. Administrators need controlled access
for deployment, patching and troubleshooting.

The first release will run on one Ubuntu VM in UK South. High availability is
not required for this exercise, but the limitations of a single VM must be
recorded.

### Business requirements

- Host a small internal document-processing service on Linux.
- Keep administrative access narrow, temporary and auditable.
- Use SSH keys rather than a password.
- Keep application data on a separate managed disk.
- Make the data-disk mount survive a reboot.
- Configure the service repeatably with cloud-init or a VM extension.
- Provide useful health checks and logs.
- Demonstrate start, stop and deallocate operations.
- Diagnose and recover at least one realistic service fault.
- Remove all chargeable resources at the end.

### Security requirements

- Do not allow SSH from the whole internet.
- Do not store a private key, public IP, tenant ID, subscription ID or secret in
  Git or screenshots.
- Disable password authentication.
- Use a non-root administrator and a non-login service account.
- Do not expose the internal application port publicly.
- Use a system-assigned managed identity for future Azure access, but do not
  grant it a role unless the workload requires one.
- Enable boot diagnostics.
- Apply least privilege to files, services and Azure access.
- Use Bastion Developer for browser-based SSH to the VM's private IP.
- Use only harmless mock documents and data.

## 2. Proposed architecture

```text
Administrator
    |
    | Browser-based SSH
    v
Azure Bastion Developer -> NSG -> NIC -> Linux VM private IP
                                      |       |
                                      |       +-- managed OS disk
                                      |       +-- managed data disk mounted by UUID
                                      |       +-- systemd document-worker service
                                      |
                               application subnet
                                      |
                                 project VNet
```

Bastion Developer was selected because it is currently available in UK South at
no extra charge, supports one browser-based VM connection and avoids a public IP
on the VM. Its shared architecture, single-connection limit, lack of peered-VNet
support and reduced feature set make it unsuitable as the default production
recommendation. A production assessment would compare dedicated Bastion SKUs,
private management connectivity and just-in-time access.

## 3. Naming and addressing plan

Use these values consistently:

| Component | Value |
| --- | --- |
| Resource group | `rg-cedar-linux-ops-uks-01` |
| Region | `UK South` |
| VNet | `vnet-cedar-linux-uks-01` |
| VNet address space | `10.90.0.0/16` |
| Subnet | `snet-cedar-workload-uks-01` |
| Subnet prefix | `10.90.1.0/24` |
| NSG | `nsg-cedar-linux-uks-01` |
| NIC | `nic-cedar-docworker-uks-01` |
| Administration path | Bastion Developer |
| VM | `vm-cedar-docworker-uks-01` |
| Data disk | `disk-cedar-docworker-data-uks-01` |
| Admin username | `azureadmin` |
| Guest service account | `docworker` |
| Service | `cedar-docworker.service` |
| Data mount | `/srv/cedar-data` |

Recommended tags:

- `owner=Sat`
- `environment=lab`
- `workload=linux-document-processing`
- `company=cedar-finch-legal`
- a short and accurate `expiry-date`

## 4. Cost and safety gate

Before deployment:

1. Confirm the correct tenant and subscription without saving identifiers.
2. Check that UK South supports the selected VM size and image.
3. Use `Standard_B2als_v2`, selected after the smaller B1s and B2s sizes were
   reported unavailable for this subscription in UK South. Its 2 vCPUs and 4 GB
   memory provide more flexibility than an available 1 GB alternative for
   updates, cloud-init and service troubleshooting.
4. Use Standard LRS managed disks unless another requirement justifies more.
5. Record the estimate from the Azure pricing calculator.
6. Note that a running or stopped-allocated VM is billed for compute.
7. Note that deallocation stops compute billing, but disks and some networking
   resources can continue to incur charges.
8. Plan to destroy the complete resource group after evidence is captured.

Confirm that Bastion Developer remains available in UK South and displays the
free Developer SKU before deployment. Do not accept an automatic paid Bastion
upgrade or enable a paid Defender plan merely to demonstrate JIT.

Checkpoint: record the selected VM size, expected working time and intended
cleanup date in the README.

## 5. Pre-deployment retrieval

Answer these before building:

1. Why is an SSH key safer than enabling password authentication?
2. Why is `0.0.0.0/0` an unsuitable source for an SSH rule?
3. What is the difference between stopping Linux inside the guest and
   deallocating the Azure VM?
4. Which resources may still cost money while the VM is deallocated?
5. Why should a persistent disk mount use a UUID rather than `/dev/sdc1`?

Record only your short answers, not copied documentation.

## 6. Prepare local files

Use the existing project folders:

```text
cloud-init/     repeatable guest configuration
data/           harmless mock input files
reference/      architecture and decision notes
scripts/        Bash, Azure CLI and PowerShell checks
terraform/      infrastructure configuration
screenshots/    selected public-safe evidence
```

Create the Terraform files only when needed:

```text
versions.tf
providers.tf
variables.tf
networking.tf
compute.tf
outputs.tf
terraform.tfvars.example
```

Keep the real `terraform.tfvars`, state files, saved plans, `.terraform/`, SSH
keys and local IP details out of Git.

## 7. Create or identify an SSH key pair

Use a dedicated 4096-bit RSA key in PEM format for the project because the
current Bastion portal local-file workflow requires an RSA PEM private key.
Azure Linux VMs also support Ed25519, but that does not make every Bastion
connection method compatible with an Ed25519 private key. Protect the private
key with a passphrase and local file permissions, and never commit or paste it
into documentation.

Verification:

- Confirm the private key is readable only by its owner.
- Confirm the public key is the file supplied to Azure.
- Confirm no private key exists inside the repository.

If an existing suitable lab key is reused, record that decision without copying
the key material.

## 8. Build the Terraform foundation

Configure:

1. A compatible Terraform version and the official AzureRM provider.
2. An `azurerm` provider with `features {}`.
3. Variables for region, resource names, address ranges, tags, VM size,
   administrator username and SSH public-key path.
4. Sensitive local values in an ignored `terraform.tfvars` file.

Run:

```bash
terraform fmt -check
terraform init
terraform validate
```

Checkpoint: validation succeeds before any Azure plan is created.

## 9. Build networking

Use Terraform to create:

1. The resource group and tags.
2. The `10.90.0.0/16` VNet.
3. The `10.90.1.0/24` workload subnet.
4. An NSG associated with the subnet or NIC, with the attachment location
   documented.
5. No public inbound SSH rule.
6. No inbound application-port rule.
7. No public IP on the VM's NIC.
8. A NIC using dynamic private addressing and IP forwarding disabled.

Do not add a custom deny-all rule merely to duplicate Azure's default inbound
deny. Understand the default NSG rules and add only the narrow exception needed.

Verification:

- Query the VNet and subnet prefixes.
- Query the NSG rule's priority, direction, source, destination port and action.
- Verify that no custom rule exposes TCP 22 to the internet.
- Verify there is no public inbound rule for the application service.

## 10. Define repeatable guest configuration

Create `cloud-init/cedar-docworker.yaml` that performs only first-boot baseline
configuration:

1. Updates the package index.
2. Installs required small packages.
3. Creates the locked-down `docworker` system account with no interactive
   login.
4. Creates `/opt/cedar-docworker` and assigns appropriate ownership.
5. Installs a small health service or script.
6. Creates a systemd unit that runs as `docworker`, not root.
7. Enables and starts the service.
8. Writes a recognisable, non-sensitive completion marker.

Keep disk discovery and permanent mounting as an administrator exercise rather
than hiding all of it inside cloud-init.

Validate YAML indentation before deployment. Avoid putting secrets or private
keys in custom data because cloud-init data and logs are not a secret store.

## 11. Build compute and storage

Use Terraform to create:

1. A small Ubuntu LTS Linux VM supported in UK South.
2. SSH public-key authentication with password authentication disabled.
3. A system-assigned managed identity with no unnecessary role assignments.
4. A Standard LRS managed OS disk.
5. Managed boot diagnostics.
6. A small Standard LRS data disk.
7. A disk attachment to the VM at a documented LUN.
8. The cloud-init file as custom data using the provider's required encoding.

Treat the exact Ubuntu image offer, SKU and version as current inputs. Confirm
them with Azure CLI or the portal rather than copying an old image reference.

## 12. Review and deploy

Run:

```bash
terraform fmt -check
terraform validate
terraform plan -out=project17.tfplan
```

Read the plan before applying it. Confirm:

- only intended resources are additions;
- there are no replacements or destroys;
- the VM has no public IP or internet-facing SSH rule;
- password authentication is disabled;
- no secret or private-key content is displayed;
- the data disk is attached to the intended VM; and
- the selected region and tags are correct.

Apply only the reviewed plan:

```bash
terraform apply "project17.tfplan"
```

Do not use a blind auto-approved apply as portfolio evidence.

## 13. Verify the Azure resource graph

Use read-only Azure CLI and Azure PowerShell queries to inventory:

- VM name, size, location and provisioning state;
- power state;
- NIC and private IP;
- absence of a public IP on the VM NIC;
- OS and data disks;
- VNet, subnet and NSG;
- effective NSG rules;
- boot diagnostics state; and
- managed identity type.

Do not include full Azure resource IDs in public screenshots because they expose
the subscription ID.

Suggested screenshot 1: a clean resource inventory with names, types and states.

## 14. Prove controlled Bastion access

Before connecting:

1. Confirm the VM has no public IP and no internet-facing SSH rule.
2. Confirm the local private-key permissions are restrictive.
3. Select Bastion Developer and confirm the portal still identifies it as the
   free Developer SKU.
4. Connect as `azureadmin` through the browser using the SSH private key without
   copying the key into the repository or evidence.
5. Prove the current username, hostname, OS release and private address.

Inside the VM, verify:

```bash
whoami
hostnamectl
cat /etc/os-release
ip -brief address
sudo cloud-init status --long
```

Suggested screenshot 2: sanitised guest identity, OS and cloud-init success.

## 15. Practise core Linux administration

Complete and explain these tasks:

1. Inspect users, groups and the `docworker` account.
2. Confirm that `docworker` cannot log in interactively.
3. Inspect file ownership and permissions under `/opt/cedar-docworker`.
4. Update the package index and list upgradable packages before changing them.
5. Inspect the service with `systemctl`.
6. Inspect recent logs with `journalctl`.
7. Inspect processes with `ps` or `systemctl show`.
8. Inspect listening sockets with `ss`.
9. Check memory, filesystem and inode use.
10. Verify name resolution with `getent hosts` or `resolvectl`.

Separate discovery from change. Record what was observed before patching or
altering a service.

## 16. Initialise and persist the data disk

First identify the unattached filesystem safely. Never assume the device name.
Use tools such as:

```bash
lsblk -f
sudo fdisk -l
```

Then:

1. Confirm the correct empty data disk by size, LUN and lack of filesystem.
2. Create one partition and filesystem on that disk only.
3. Create `/srv/cedar-data`.
4. Mount the filesystem temporarily and test a harmless write.
5. Retrieve its UUID with `blkid`.
6. Back up `/etc/fstab` before changing it.
7. Add a UUID-based entry with the `nofail` option.
8. Test with `mount -a` and inspect the exit status.
9. Reboot and confirm the same filesystem is mounted at the same path.

Main risk: formatting the wrong device or writing an invalid `fstab` entry can
destroy data or prevent normal boot. Stop and re-check if the device identity is
unclear.

Suggested screenshot 3: `lsblk -f` or `findmnt` proving the UUID-backed mount.

## 17. Build a Bash health check

Create `scripts/check-cedar-docworker.sh` that checks:

- the systemd service is active;
- its expected port is listening locally;
- the local health request succeeds;
- `/srv/cedar-data` is mounted;
- disk usage is below a defined threshold; and
- DNS resolution succeeds.

Requirements:

- Use meaningful variable names.
- Quote variables.
- Print short labelled results.
- Return exit code `0` only when all checks pass.
- Return a non-zero exit code when any required check fails.
- Do not hide errors with unconditional `|| true`.

Run it in both a healthy and deliberately unhealthy state and print `$?` after
each run.

## 18. Controlled service fault and recovery

Use one primary troubleshooting story for the portfolio:

1. Record the healthy service state and health-check result.
2. Stop `cedar-docworker.service` deliberately.
3. Run the health check and observe the non-zero result.
4. Inspect `systemctl status` and relevant `journalctl` entries.
5. Form a hypothesis from the evidence.
6. Start the service.
7. Run the health check again and verify exit code `0`.
8. Record symptom, evidence, cause, correction and prevention.

Optional short repetitions, not additional full reports:

- deny the service account access to one mock file and diagnose permissions;
- fill a small disposable loopback filesystem rather than the OS filesystem;
- test a temporary bad name-resolution condition and restore it; or
- inspect a failed cloud-init command in `/var/log/cloud-init*.log`.

Never deliberately fill the VM's real OS disk.

Suggested screenshot 4: the failed check plus relevant service evidence.
Suggested screenshot 5: the successful retest after recovery.

## 19. Compare VM lifecycle states

Observe and record:

1. Running.
2. Guest shutdown or Azure power-off, which can leave the VM stopped but still
   allocated.
3. Azure deallocation.
4. Restart after deallocation.
5. Service health and persistent data-disk mount after restart.

Explain which state releases the compute allocation and which attached
resources can continue to cost money.

## 20. Verify the private administration boundary

After the access, disk and service tests:

1. Save the healthy guest and Azure verification evidence.
2. Verify the VM still has only a private IP.
3. Verify no custom inbound internet SSH rule exists.
4. Verify access is possible through Bastion Developer.
5. Document the Developer SKU limitations and the production alternative.

## 21. Final verification

Before cleanup, prove:

- Terraform reports no unexpected drift.
- The VM and data disk are healthy.
- Boot diagnostics is enabled.
- Password authentication is disabled in the desired configuration.
- The managed identity exists without excess role assignments.
- The data disk is mounted by UUID after reboot.
- The service is active and the health script returns `0`.
- No public IP or inbound SSH rule remains.
- No application port is publicly allowed.
- No secrets or identifiers are present in tracked files or selected images.

Record limitations honestly:

- one VM is a single point of failure;
- the project does not prove application-level high availability;
- Bastion Developer is suitable for this exercise but not the default production
  design;
- managed identity is enabled but deliberately has no Azure permissions; and
- boot diagnostics does not replace centralised monitoring and alerting.

## 22. Evidence and documentation

Keep no more than five embedded screenshots in the final README. Recommended
evidence:

1. Azure resource and dependency inventory.
2. Guest OS and cloud-init success.
3. Persistent UUID-backed data-disk mount.
4. Controlled service failure and diagnosis.
5. Successful recovery or final private-only network state.

The README must explain:

- the business problem;
- the selected architecture and rejected alternatives;
- security and cost decisions;
- what was built;
- how it was independently verified;
- the troubleshooting result;
- limitations; and
- cleanup.

Inspect and crop every image before publication. Remove account addresses,
tenant IDs, subscription IDs, resource IDs, public IPs and unrelated browser
content.

## 23. Cleanup

Before destruction:

1. Capture final public-safe verification.
2. Run `terraform plan` and confirm there is no unexplained drift.
3. Create a saved destroy plan.
4. Confirm it contains only Project 17 resources.

Then apply the reviewed destroy plan. Finally verify:

- `terraform state list` returns nothing;
- the Project 17 resource group does not exist;
- no Project 17 VM, disk, NIC or snapshot remains; and
- local Terraform source, scripts and documentation still exist.

Never delete an SSH key that is used by another environment. Remove a dedicated
disposable key only after confirming it is no longer needed.

## 24. Completion questions

Explain without notes:

1. Why was Bastion Developer selected instead of a VM public IP?
2. Why was the application port not opened publicly?
3. What dependency does the NIC have on the subnet?
4. Why was the disk mounted by UUID with `nofail`?
5. What did the health-check exit code prove?
6. What evidence separated the stopped service from an NSG or DNS fault?
7. Why can a deallocated VM still produce charges?
8. When would dedicated Bastion, JIT or private management connectivity be
   preferable to Bastion Developer?
9. What can a system-assigned managed identity do before it receives a role?
10. What would need to change before this single-VM design supported a critical
    production workload?

## Official references

- [Connect to an Azure Linux VM](https://learn.microsoft.com/en-us/azure/virtual-machines/linux-vm-connect)
- [Developer and administrator access to Azure VMs](https://learn.microsoft.com/en-us/azure/networking/design-guide/developer-admin-access)
- [Connect to a Linux VM through Azure Bastion](https://learn.microsoft.com/en-us/azure/bastion/bastion-connect-vm-ssh-linux)
- [Azure VM states and billing](https://learn.microsoft.com/en-us/azure/virtual-machines/states-billing)
- [Attach and mount a data disk on a Linux VM](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal)
- [Use cloud-init with Azure Linux VMs](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/using-cloud-init)
- [Troubleshoot cloud-init](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/cloud-init-troubleshooting)
- [Troubleshoot a full Linux OS disk](https://learn.microsoft.com/en-us/troubleshoot/azure/virtual-machines/linux/linux-fulldisk-boot-error)
- [Azure pricing calculator](https://azure.microsoft.com/en-gb/pricing/calculator/)

## Exit gate

Project 17 is complete only when you can deploy the environment safely, access
it through a controlled path, administer the Linux guest, persistently mount the
data disk, diagnose and restore the service, explain the lifecycle and billing
states, remove public administration, verify final security, and prove cleanup.
