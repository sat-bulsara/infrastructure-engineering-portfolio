# Azure Identity and RBAC Code Snippets

These commands are adapted from the completed lab. Replace the example names
with authorised lab values. Object identifiers are resolved into shell variables
and should not be copied into Git.

## Azure CLI

### Confirm the active subscription without printing its identifier

```bash
az account show \
  --query "{Subscription:name, State:state, Default:isDefault}" \
  --output table
```

This is read-only. Confirm the name and default state before querying or changing
Azure resources.

### Resolve the fictional user privately

```bash
USER_ID="$(az ad user list \
  --display-name 'azure-lab-reader-01' \
  --query '[0].id' \
  --output tsv)"

if [[ -n "$USER_ID" ]]; then
  echo 'Test user resolved'
else
  echo 'Test user was not found'
fi
```

The identifier remains in the current shell variable. Do not print it into a
public screenshot or committed output.

### Check group membership

```bash
az ad group member check \
  --group 'sg-azure-resource-readers' \
  --member-id "$USER_ID" \
  --query value \
  --output tsv
```

Expected output is `true` when the user is a member and `false` when the user is
not a member.

### Add and remove membership

These commands change Microsoft Entra state.

```bash
az ad group member add \
  --group 'sg-azure-resource-readers' \
  --member-id "$USER_ID"

az ad group member remove \
  --group 'sg-azure-resource-readers' \
  --member-id "$USER_ID"
```

Run the separate membership check after either command.

### Verify the group role assignment

```bash
GROUP_ID="$(az ad group show \
  --group 'sg-azure-resource-readers' \
  --query id \
  --output tsv)"

az role assignment list \
  --assignee-object-id "$GROUP_ID" \
  --resource-group 'rg-identity-access-lab-uks-01' \
  --query "[?roleDefinitionName=='Reader'].{Principal:principalName, Type:principalType, Role:roleDefinitionName}" \
  --output table
```

Expected fields are the group name, principal type `Group` and role `Reader`.

## Azure PowerShell

### Connect using a device code when required on macOS

```powershell
Connect-AzAccount -DeviceCode
```

Authentication alone does not prove the correct subscription is selected.

### Confirm the active context without printing identifiers

```powershell
Get-AzContext |
    Select-Object `
        @{Name = 'Subscription'; Expression = { $_.Subscription.Name }},
        Environment |
    Format-List
```

### Verify the role assignment

```powershell
Get-AzRoleAssignment `
    -ResourceGroupName 'rg-identity-access-lab-uks-01' |
    Where-Object {
        $_.DisplayName -eq 'sg-azure-resource-readers' -and
        $_.RoleDefinitionName -eq 'Reader'
    } |
    Select-Object `
        @{Name = 'Principal'; Expression = { $_.DisplayName }},
        @{Name = 'Type'; Expression = { $_.ObjectType }},
        @{Name = 'Role'; Expression = { $_.RoleDefinitionName }},
        @{Name = 'Scope'; Expression = { 'Resource group' }} |
    Format-Table
```

This query is read-only. Expected output is the security group, object type
`Group`, role `Reader` and the labelled resource-group scope.

## Cleanup Verification Pattern

After removing an object, use a narrow query and expect zero results. For
example:

```bash
az ad user list \
  --display-name 'azure-lab-reader-01' \
  --query 'length(@)' \
  --output tsv
```

Expected output after cleanup is `0`.
