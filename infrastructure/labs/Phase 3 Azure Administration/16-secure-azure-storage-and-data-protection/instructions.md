# Project 16 instructions

These instructions reproduce the verified learning path without embedding
subscription IDs, object IDs, keys or SAS tokens. Review every change before
running it in another environment.

## 1. Establish the lab boundary

Verify the active subscription, create `rg-northstar-storage-lab-uks-01` in UK
South and apply the `owner`, `environment`, `workload`, `company` and
`expiry-date` tags. Query the result independently.

[Official resource-group guide](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/manage-resource-groups-cli)

## 2. Create the storage baseline

Create `stnorthstardocsuks01` with StorageV2, Standard_ZRS, Hot tier, HTTPS,
TLS 1.2, disabled anonymous Blob access, disabled Shared Key, firewall default
deny and no trusted-services bypass. Public access is temporary during the
controlled bootstrap test. Create the private `documents` container and verify
`publicAccess: None`.

[Official secure-storage guide](https://learn.microsoft.com/en-us/azure/storage/common/secure-storage)

## 3. Apply least-privilege identity access

Create the security-enabled Entra group `sg-northstar-blob-contributors`, add
the authorised test user and assign `Storage Blob Data Contributor` at the exact
`documents` container scope. Verify principal type, role and scope separately.
Do not publish object IDs or complete resource IDs.

[Official Blob role-assignment guide](https://learn.microsoft.com/en-us/azure/storage/blobs/assign-azure-role-data-access)

## 4. Configure and test data protection

Enable Blob versioning, 14-day Blob soft delete and 14-day container soft
delete. Apply `reference/lifecycle-policy.json`, which removes previous versions
under the test prefix after 30 days. Upload two genuine plain-text versions to
the same Blob with `--auth-mode login`, list the versions and download the
non-current version by its version ID.

[Blob versioning](https://learn.microsoft.com/en-us/azure/storage/blobs/versioning-overview) and [lifecycle management](https://learn.microsoft.com/en-us/azure/storage/blobs/lifecycle-management-overview)

## 5. Build private networking with Terraform

From `terraform/` initialise, format and validate the configuration. It reads
the existing resource group and storage account as data sources and creates the
VNet, subnet, Private DNS zone, VNet link, Blob private endpoint and DNS zone
group. Create and review a saved plan before each apply.

```bash
terraform init
terraform fmt
terraform validate
terraform plan
```

[Terraform plan](https://developer.hashicorp.com/terraform/cli/commands/plan) and [Storage private endpoints](https://learn.microsoft.com/en-us/azure/storage/common/storage-private-endpoints)

## 6. Verify and lock down the network

Verify the private endpoint is `Succeeded` and `Approved`, follow its NIC to
verify an IP in `10.70.1.0/24`, and verify the Private DNS A record maps to the
same address. Record that a true data-path test requires a client inside the
linked VNet. Disable public network access, remove the temporary client IP rule
and verify zero IP rules remain.

[Official Storage network-security guide](https://learn.microsoft.com/en-us/azure/storage/common/storage-network-security)

## 7. Cleanup

Do this only after reviewing the evidence:

```bash
cd terraform
terraform plan -destroy -out=project16-destroy.tfplan
terraform show project16-destroy.tfplan
terraform apply "project16-destroy.tfplan"
terraform state list
```

The plan should destroy only the Terraform-managed network resources. Then:

```bash
az group delete \
  --name rg-northstar-storage-lab-uks-01 \
  --yes

az ad group delete \
  --group sg-northstar-blob-contributors
```

Verify that `az group exists --name rg-northstar-storage-lab-uks-01` returns
`false`, and that the Entra group lookup reports no matching group.

[Terraform destroy planning](https://developer.hashicorp.com/terraform/cli/commands/plan#planning-options) and [resource-group deletion](https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/delete-resource-group)
