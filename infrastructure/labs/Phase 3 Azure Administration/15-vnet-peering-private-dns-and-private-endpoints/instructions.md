# Instructions: VNet peering, Private DNS and private endpoints

## Objective

Connect a hub and application spoke, expose Blob Storage through a private endpoint, configure private name resolution, disable the public network path and recover a missing DNS link through Terraform.

## Safe workflow

1. Confirm the Azure context, UK South region, cost boundary and disposable resource groups.
2. Use non-overlapping address spaces: `10.40.0.0/16` for the hub and `10.50.0.0/16` for the spoke.
3. Create one subnet in each VNet and peer the VNets in both directions.
4. Verify both peerings independently before adding the service.
5. Create an inexpensive Standard LRS storage account with TLS 1.2 and anonymous Blob access disabled.
6. Create a Blob private endpoint in the hub subnet and confirm that its connection is approved.
7. Create `privatelink.blob.core.windows.net`, link both VNets and verify the private `A` record.
8. Disable storage public network access only after the private configuration is healthy.
9. Remove the spoke DNS link as a controlled fault, detect the drift with `terraform plan`, restore it and verify both links.
10. Review a destroy plan, remove the environment and query both resource groups independently.

## Terraform workflow

```text
terraform fmt
terraform validate
terraform plan -out="<reviewed-plan>.tfplan"
terraform apply "<reviewed-plan>.tfplan"
```

For cleanup:

```text
terraform plan -destroy -out="project15-destroy.tfplan"
terraform apply "project15-destroy.tfplan"
```

Never commit `.tfplan`, `.terraform/`, `terraform.tfstate` or backup state files.

## Evidence checklist

- Tagged lab scopes
- Bidirectional peering state and settings
- Storage security configuration
- Private DNS `A` record
- Missing-link drift and successful recovery
- Final resource-group absence

## Scope limitation

This procedure validates Azure control-plane configuration. Add a disposable workload inside the spoke in a later variation if end-to-end DNS resolution and Blob data-plane access must be proven.
