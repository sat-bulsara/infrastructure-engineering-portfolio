# Instructions: virtual networks, subnets and NSGs

## Objective

Create a three-tier virtual network, protect each subnet with a dedicated NSG, verify it with Azure CLI, practise a safe break/fix, and recreate it with Terraform.

## Workflow

1. Confirm the active tenant, subscription, region and disposable resource group.
2. Create the VNet with `10.20.0.0/16` and three `/24` subnets.
3. Create and associate one NSG per subnet.
4. Add only the required custom rules and query them in priority order.
5. Add one temporary higher-priority deny, observe the conflict, remove it and verify recovery.
6. Repeat the architecture in `terraform/`: `fmt`, `init`, `validate`, `plan`, `apply`, independent checks, destroy plan and cleanup.

## Evidence

Capture the address plan, final rule inventory, Terraform plan, independent verification and cleanup state. Do not publish subscription IDs, tenant IDs, emails, tokens or raw terminal captures containing them.

## Limitations

No VMs or NICs were deployed, so effective traffic behaviour was not tested. Azure Firewall, private endpoints, routing and flow logs belong in later projects.
