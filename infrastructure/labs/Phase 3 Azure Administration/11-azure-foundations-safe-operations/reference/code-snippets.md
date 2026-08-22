# Initial Azure Setup Code Snippets

Commands used during the initial setup lab for discovery, verification,
Terraform and cleanup. Read-only and state-changing commands are labelled.
The commands retain the resource names used in the completed lab as factual
evidence. Replace those names with neutral project names on future repeats.
Never publish tenant IDs, subscription IDs, device codes, tokens or account
details.

## Azure CLI Context

Changes the local authenticated session:

```bash
az login --output none
```

For stale authentication:

```bash
az logout
az login --output none
```

Read-only, public-safe context check:

```bash
az account show \
  --query "{Subscription:name, State:state, Default:isDefault}" \
  --output table
```

Read-only subscription list without IDs:

```bash
az account list \
  --query "[].{Subscription:name, State:state, Default:isDefault}" \
  --output table
```

Changes active subscription:

```bash
az account set --subscription '<subscription-name>'
```

Repeat the context check after changing or refreshing authentication.

## Azure CLI Verification

Read-only resource-group query:

```bash
az group show \
  --name 'rg-az104-foundations-lab-uks-01' \
  --query "{Name:name, Location:location, State:properties.provisioningState, Tags:tags}" \
  --output yaml
```

Read-only lock query:

```bash
az lock list \
  --resource-group 'rg-az104-foundations-lab-uks-01' \
  --query "[].{Name:name, Level:level, Notes:notes}" \
  --output table
```

Expected lock level: `CanNotDelete`.

Read-only Activity Log query:

```bash
az monitor activity-log list \
  --resource-group 'rg-az104-foundations-lab-uks-01' \
  --offset 1d \
  --query "[].{Operation:operationName.localizedValue, Status:status.localizedValue, Time:eventTimestamp}" \
  --output table
```

Read-only existence check:

```bash
az group exists \
  --name 'rg-az104-foundations-lab-uks-01'
```

Expected before cleanup: `true`. Expected after cleanup: `false`.

## Azure PowerShell Context

Changes the authenticated session:

```powershell
Connect-AzAccount | Out-Null
```

Device authentication when browser sign-in is unavailable:

```powershell
Connect-AzAccount -UseDeviceAuthentication | Out-Null
```

Never publish the temporary device code.

Read-only, public-safe context check:

```powershell
Get-AzContext |
    Select-Object `
        @{Name = 'Subscription'; Expression = { $_.Subscription.Name }},
        Environment |
    Format-List
```

Changes the PowerShell subscription context:

```powershell
Set-AzContext -Subscription '<subscription-name>' | Out-Null
```

Repeat `Get-AzContext` immediately afterwards.

## Azure PowerShell Resource Group

Read-only:

```powershell
Get-AzResourceGroup `
    -Name 'rg-az104-foundations-lab-uks-01' |
    Select-Object `
        ResourceGroupName,
        Location,
        ProvisioningState,
        @{Name = 'Environment'; Expression = { $_.Tags['environment'] }},
        @{Name = 'ExpiryDate'; Expression = { $_.Tags['expiry-date'] }},
        @{Name = 'Owner'; Expression = { $_.Tags['owner'] }},
        @{Name = 'Workload'; Expression = { $_.Tags['workload'] }} |
    Format-List
```

## Azure PowerShell Lock

Read-only:

```powershell
Get-AzResourceLock `
    -ResourceGroupName 'rg-az104-foundations-lab-uks-01' |
    Select-Object `
        Name,
        @{Name = 'LockLevel'; Expression = { $_.Properties.Level }},
        @{Name = 'Notes'; Expression = { $_.Properties.Notes }} |
    Format-Table
```

The expressions use nested `Properties` because that is where this environment's
returned lock object exposed its level and notes.

## Terraform Subscription Context

Reads the verified CLI context and sets a shell variable without printing it:

```bash
export ARM_SUBSCRIPTION_ID="$(az account show --query id --output tsv)"
```

Checks presence only:

```bash
if [[ -n "$ARM_SUBSCRIPTION_ID" ]]; then
  echo 'Terraform subscription context is set'
else
  echo 'Terraform subscription context is missing'
fi
```

Presence does not prove correctness. Check the CLI subscription name separately.

## Terraform Initialise and Validate

Downloads the provider and prepares the directory:

```bash
terraform init
```

Read-only checks:

```bash
terraform fmt -check
terraform validate
```

## Terraform Plan and Apply

Reads state and writes a plan file without applying Azure changes:

```bash
terraform plan -out=build11.tfplan
```

Expected:

```text
Plan: 2 to add, 0 to change, 0 to destroy.
```

Changes live Azure using the reviewed plan:

```bash
terraform apply build11.tfplan
```

Verify the group and lock independently with Azure CLI after apply.

## Terraform State

Read-only:

```bash
terraform state list
```

Expected before cleanup:

```text
azurerm_management_lock.prevent_delete
azurerm_resource_group.foundations
```

## Terraform Destroy

Writes a destroy plan but does not destroy resources yet:

```bash
terraform plan -destroy -out=build11-destroy.tfplan
```

Expected:

```text
Plan: 0 to add, 0 to change, 2 to destroy.
```

Destructive, removes the two reviewed Terraform-managed objects:

```bash
terraform apply build11-destroy.tfplan
```

Verify absence independently:

```bash
az group exists \
  --name 'rg-az104-foundations-tf-lab-uks-01'
```

Expected: `false`.

## Local Generated Files

Do not commit:

```text
.terraform/
*.tfplan
*.tfstate
*.tfstate.*
crash.log
crash.*.log
.terraform.tfstate.lock.info
*.tfvars
```

Retain and review:

```text
main.tf
providers.tf
versions.tf
.terraform.lock.hcl
.gitignore
```

Terraform state can contain sensitive values. Later collaborative builds should
use an appropriately protected remote backend rather than Git.
