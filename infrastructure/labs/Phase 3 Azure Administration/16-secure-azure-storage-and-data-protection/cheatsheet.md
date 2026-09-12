# Project 16 cheat sheet

## Decision map

| Requirement | Azure control |
| --- | --- |
| Object access over HTTPS | Blob Storage |
| Survive one regional zone failure | ZRS |
| Recover an overwritten Blob | Blob versioning |
| Recover a deleted Blob or container | Soft delete |
| Limit old-version growth | Lifecycle management |
| Group-based data access | Blob data role through Entra ID |
| Narrowest useful scope | Container scope |
| Private Blob network path | Private endpoint |
| Resolve Blob to private IP | `privatelink.blob.core.windows.net` |

## Important distinctions

- Management-plane Contributor does not automatically grant Blob data access.
- RBAC answers who may act; network controls answer where they may connect from.
- ZRS provides zonal resilience; it does not recover an accidental overwrite.
- Versioning and soft delete provide recovery; lifecycle controls age and cost.
- Service endpoints still use the public service endpoint. Private endpoints
  represent the service through a private interface in the VNet.
- Blob, Files, Queue, Table and DFS require their own relevant private endpoints
  and DNS zones when those subresources are used.

## Terraform workflow

```bash
terraform fmt
terraform validate
terraform plan -out=reviewed.tfplan
terraform apply "reviewed.tfplan"
terraform plan
```

Read every add, change and destroy count before applying.

## Retrieval prompts

1. Why does ZRS fit Northstar better than GRS?
2. Why can Blob Data Contributor still receive a network error?
3. Which feature recovers an overwritten document?
4. Why is a lifecycle rule not a backup?
5. Why might a laptop outside the VNet resolve the public Blob address?
