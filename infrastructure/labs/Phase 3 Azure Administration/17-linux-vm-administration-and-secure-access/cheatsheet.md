# Project 17 Cheatsheet

Run commands from the directory stated in each section. Replace example names rather than pasting them blindly.

## Terraform lifecycle

From `terraform/`:

```bash
terraform fmt -check
terraform validate
terraform plan -out=project17.tfplan
terraform apply "project17.tfplan"
terraform state list
terraform plan -detailed-exitcode
```

Detailed plan exit codes:

- `0`: no changes
- `1`: Terraform error
- `2`: changes detected

A saved plan is a snapshot of configuration and state. If state changes, create a fresh plan rather than applying a stale one.

## Azure VM inventory

```bash
az vm show \
  --resource-group <resource-group> \
  --name <vm-name> \
  --show-details \
  --query '{Name:name,Size:hardwareProfile.vmSize,PowerState:powerState,PrivateIP:privateIps,PublicIP:publicIps}' \
  --output yaml
```

```bash
az vm list-usage \
  --location uksouth \
  --query "[].{Family:name.localizedValue,Used:currentValue,Limit:limit}" \
  --output table
```

## Private-network verification

```bash
az network nic show \
  --resource-group <resource-group> \
  --name <nic-name> \
  --query '{PrivateIP:ipConfigurations[0].privateIPAddress,PublicIP:ipConfigurations[0].publicIPAddress}' \
  --output yaml
```

```bash
az network nsg show \
  --resource-group <resource-group> \
  --name <nsg-name> \
  --query "{NSG:name,CustomInboundRules:length(securityRules[?direction=='Inbound']),InternetSSHRules:length(securityRules[?direction=='Inbound' && access=='Allow' && destinationPortRange=='22'])}" \
  --output yaml
```

## Linux service checks

```bash
systemctl is-active cedar-docworker.service
systemctl status cedar-docworker.service --no-pager
journalctl --unit cedar-docworker.service --lines 20 --no-pager
ss -ltn | grep ':8080 '
curl --fail --silent http://127.0.0.1:8080/health.txt
```

## Managed-disk discovery

```bash
lsblk --output NAME,PATH,SIZE,TYPE,FSTYPE,MOUNTPOINTS
find /dev/disk/azure -maxdepth 4 -type l -exec sh -c 'printf "%s -> %s\n" "$1" "$(readlink -f "$1")"' sh {} \;
sudo blkid <partition>
findmnt /srv/cedar-data
```

Use an Azure LUN link to identify the correct disk before partitioning. Formatting destroys data, so do not infer the target from a device name alone.

Persistent `/etc/fstab` pattern:

```text
UUID=<filesystem-uuid> /srv/cedar-data ext4 defaults,nofail 0 2
```

Validate before rebooting:

```bash
sudo mount -a
findmnt /srv/cedar-data
```

## VM lifecycle

```bash
az vm stop --resource-group <resource-group> --name <vm-name>
az vm deallocate --resource-group <resource-group> --name <vm-name>
az vm start --resource-group <resource-group> --name <vm-name>
```

Stopping inside the guest or using `az vm stop` does not necessarily release the compute allocation. Deallocation does.

## Safe cleanup checks

```bash
terraform plan -destroy -out=project17-destroy.tfplan
terraform show -no-color project17-destroy.tfplan | grep '^Plan:'
terraform apply "project17-destroy.tfplan"
terraform state list
az group exists --name <resource-group>
```
