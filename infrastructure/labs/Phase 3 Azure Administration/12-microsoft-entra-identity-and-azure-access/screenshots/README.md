# Screenshot Evidence Index

The public evidence set is capped at five screenshots. Each image is cropped to
the relevant result and proves a different stage of the access lifecycle.

| Number | Filename | Evidence |
| --- | --- | --- |
| 01 | `01-effective-access-through-group.png` | The test user inherited Reader through `sg-azure-resource-readers` at the resource-group scope |
| 02 | `02-reader-role-denied-tag-write.png` | Reader could not save a tag change and Azure returned `AuthorizationFailed` |
| 03 | `03-leaver-access-removed.png` | Removing group membership removed access to the resource group |
| 04 | `04-cli-membership-restored.png` | Azure CLI changed the membership check from `false` to `true` after restoration |
| 05 | `05-powershell-rbac-verification.png` | Azure PowerShell returned the group, Reader role and resource-group scope |

## Private Raw Captures

Unused raw captures are retained locally under `raw-private/` for review. That
folder is Git-ignored because some images contain unnecessary account names,
domains, object identifiers or subscription metadata. They are not portfolio
evidence and must not be committed.
