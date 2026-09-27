# Project 17 Terraform network foundation

- Date: 2026-09-17
- Status: Terraform network configuration complete; cloud-init in progress
- Outcome: The Cedar private VM boundary is now represented by valid Terraform containing a resource group, VNet, workload subnet, subnet-associated NSG and NIC with dynamic private addressing, disabled IP forwarding and no public IP reference.
- Security decision: No custom public SSH or application rule was added. Bastion Developer remains the planned private management path.
- Learning evidence: Sat constructed the initial HCL blocks and repaired several resource-reference errors. Full help was used for some final references and repetitive input values, so independent Terraform fluency is not yet claimed.
- Cloud-init state: The YAML header, package-index refresh and `curl`, `jq` and `dnsutils` package list are valid. The discussed `docworker` account block is not yet present.
- Next action: Add a password-locked, non-interactive `docworker` system account while preserving the default Azure administrator.
