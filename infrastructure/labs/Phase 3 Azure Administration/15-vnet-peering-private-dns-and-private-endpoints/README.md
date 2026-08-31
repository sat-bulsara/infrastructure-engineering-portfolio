# Project 15: VNet peering, Private DNS and private endpoints

This learning lab connects an application spoke to shared services in a hub without exposing the service through its public network endpoint. I built the initial hub boundary with Azure CLI, adopted it into Terraform, added the spoke and bidirectional peering, then published Azure Blob Storage through a private endpoint and Private DNS.

## Business need

An application network needs to reach a shared storage service over private Azure networking. The design must keep the address spaces separate, provide DNS visibility to both networks, prevent anonymous Blob access and leave no paid resources behind after testing.

## Architecture

```mermaid
flowchart LR
    App[Application spoke<br/>10.50.0.0/16] <-->|Bidirectional VNet peering| Hub[Connectivity hub<br/>10.40.0.0/16]
    Hub --> PE[Blob private endpoint<br/>10.40.1.4]
    PE --> Storage[StorageV2<br/>Standard LRS]
    DNS[privatelink.blob.core.windows.net] -. linked .-> App
    DNS -. linked .-> Hub
    DNS --> PE
```

The hub and spoke used non-overlapping address spaces. Both peerings reached `Connected`, allowed VNet access and deliberately left forwarded traffic, gateway transit and remote gateways disabled.

![Both disposable resource groups created with consistent tags](screenshots/02-project-resource-groups.png)
![Both VNet peerings connected with the intended flags](screenshots/06-bidirectional-peering-verification.png)

## Private storage path

The storage account used `StorageV2`, Standard LRS and TLS 1.2. Anonymous Blob access was disabled from the beginning. Public network access was left enabled only for the controlled before-and-after configuration, then disabled after the private endpoint, DNS record and both VNet links had been verified.

The Blob private endpoint was approved in `snet-private-endpoints-uks-01`. Its zone group created an `A` record mapping `stsatprivateuks01` to `10.40.1.4` in `privatelink.blob.core.windows.net`.

![Storage security baseline before the public network path was disabled](screenshots/07-storage-security-baseline.png)
![Private DNS record mapped the Blob service to 10.40.1.4](screenshots/08-private-dns-a-record.png)

## Terraform and troubleshooting

[`terraform/main.tf`](terraform/main.tf) records the complete dependency graph. I imported the existing hub resource group, spoke resource group, hub VNet and private-endpoint subnet, reached a no-change plan, and then used reviewed plans to add the spoke, application subnet, peerings, storage account, private endpoint and DNS configuration.

For the break/fix exercise, I manually removed the spoke DNS-zone link. Terraform refreshed Azure state and proposed exactly one addition. Applying the repair plan restored `link-storage-blob-spoke`, and PowerShell then showed both hub and spoke links in the `Completed` state. This represents a realistic configuration-drift incident where peering remains healthy but the application network loses private DNS visibility.

## Security decisions

- Public network access and anonymous Blob access were both disabled in the final live state.
- The private endpoint targeted only the `blob` storage subresource.
- Both VNets were linked to Private DNS because peering does not automatically share zone visibility.
- No access keys, connection strings, credentials or test data were stored in the repository.
- Generated Terraform plans and local state are excluded from Git.

## Verification and limitations

Azure CLI and PowerShell independently verified the resource groups, VNet and subnet configuration, peering state, storage settings, approved private endpoint, private DNS record, VNet links and final cleanup.

No VM or other workload was deployed inside the spoke, so an end-to-end DNS query and data-plane Blob request were not performed. The retained evidence proves the control-plane configuration, not application traffic. The service-endpoint comparison, public DNS variation, overlapping-address test and one-sided-peering fault remain later practice rather than completed work.

## Cost and cleanup

The private endpoint, Private DNS zone and storage account were short-lived paid resources. A reviewed destroy plan removed all 13 Terraform-managed resources. Azure CLI then independently returned `false` for both lab resource groups.

![Both Project 15 resource groups verified absent after cleanup](screenshots/09-cleanup-verification.png)

## Supporting files

- [`instructions.md`](instructions.md)
- [`cheatsheet.md`](cheatsheet.md)
- [`code-snippets.md`](code-snippets.md)
- [`scripts/azure-cli.sh`](scripts/azure-cli.sh)
- [`terraform/`](terraform/)

## References

- [Azure VNet peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
- [Azure Private Endpoint DNS configuration](https://learn.microsoft.com/en-us/azure/private-link/private-endpoint-dns)
- [Azure Storage private endpoints](https://learn.microsoft.com/en-us/azure/storage/common/storage-private-endpoints)
- [Azure Private Link pricing](https://azure.microsoft.com/en-gb/pricing/details/private-link/)
- [Terraform import](https://developer.hashicorp.com/terraform/cli/commands/import)
- [Terraform plan](https://developer.hashicorp.com/terraform/cli/commands/plan)
