# Code snippets: networking lab

## Safe context and inventory

```bash
az account show --query "{Subscription:name, State:state, Default:isDefault, Directory:tenantDisplayName}" --output table
az network vnet show -g rg-networking-lab-uks-01 -n vnet-networking-lab-uks-01 --query "{VNet:name, AddressSpace:addressSpace.addressPrefixes[0], Location:location, State:provisioningState}" -o table
az network vnet subnet list -g rg-networking-lab-uks-01 --vnet-name vnet-networking-lab-uks-01 --query "[].{Name:name, Prefix:addressPrefix, NSG:networkSecurityGroup.id}" -o table
```

## Ordered custom rules

```bash
az network nsg rule list -g rg-networking-lab-uks-01 --nsg-name nsg-web-uks-01 --query "sort_by([?priority < \`65000\`], &priority).{Priority:priority, Name:name, Access:access, Port:destinationPortRange}" -o table
```

## Terraform workflow

```bash
terraform fmt -check
terraform init
terraform validate
terraform plan -out=project14.tfplan
terraform apply project14.tfplan
terraform plan -destroy -out=project14-destroy.tfplan
terraform apply project14-destroy.tfplan
```

Do not commit plan files or Terraform state. Verify the Azure resource group is absent after cleanup.
