# ML15-02: Bidirectional VNet Peering from Requirements

## Skill and repetition

- Skill: Build and verify two-way Azure VNet peering from business requirements
- Related project: Project 15
- Repetition level: R3 Independent
- Previous evidence: Guided hub-and-spoke peering built with Terraform
- Target help level: None to Hint
- Timebox: 40 minutes

## Company scenario

Redwood Legal Technology provides document-management software to UK law firms.
Its development platform and internal security tooling currently run in separate
Azure virtual networks. Developers need private access from the application
network to a vulnerability-reporting service in the security network. The
security team also needs return connectivity for health checks and controlled
administration.

The two networks are in UK South, use Azure-provided DNS and contain no gateway
or network virtual appliance. Transitive routing, gateway transit and public
application exposure are not required.

## Requirements

| Component | Required value |
| --- | --- |
| Resource group | `rg-redwood-connectivity-uks-01` |
| Application VNet | `vnet-redwood-app-uks-01` |
| Application address space | `10.81.0.0/16` |
| Application subnet | `snet-redwood-app-uks-01`, `10.81.1.0/24` |
| Security VNet | `vnet-redwood-security-uks-01` |
| Security address space | `10.82.0.0/16` |
| Security subnet | `snet-redwood-tools-uks-01`, `10.82.1.0/24` |
| Region | UK South |
| Forwarded traffic | Disabled |
| Gateway transit | Disabled |
| Remote gateways | Disabled |

Use standard project tags for owner, environment, workload and expiry. Use
generated non-sensitive data only. The company and scenario are simulated
case-study material, but the design and verification standard are treated as a
real client engagement.

## Security and cost gate

- Confirm the active subscription before deployment.
- Use non-overlapping private address spaces.
- Do not create public IPs, VMs, gateways, Bastion or firewalls.
- Do not add permissive NSG rules merely to make peering appear successful.
- Peering is not transitive and does not override NSGs or routes.
- Review current peering data-transfer pricing before sending test traffic.
- Delete the disposable resource group after ML15-03 and verify absence.

## Independent task

Using Terraform, create both VNets and both peering directions from the stated
requirements. Choose clear Terraform resource labels and explicit dependency
references. Do not copy the Project 15 file verbatim.

Before applying, explain:

1. why two peering resources are required;
2. why the address spaces must not overlap;
3. why forwarded traffic and gateway transit are disabled; and
4. what `Connected` proves and what it does not prove.

## Verification evidence

The exercise is healthy only when:

- `terraform fmt` and `terraform validate` succeed;
- the reviewed plan contains only intended additions;
- both peering objects report `Connected`;
- each remote address space is correct;
- virtual-network access is enabled in both directions;
- forwarded traffic, gateway transit and remote gateways remain disabled; and
- no unexpected public IP or chargeable compute resource exists.

Do not clean up after the healthy verification. ML15-03 will introduce a
one-sided peering fault in the same disposable environment.

## Layered hints

1. Hint: Azure models each direction as its own peering object.
2. Partial: each peering needs the local resource group and VNet name plus the
   remote VNet resource ID.
3. Full: supply complete HCL only after an attempted configuration has been
   reviewed, then require a changed explanation.

## Official sources

- [Azure VNet peering overview](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-peering-overview)
- [Create or change VNet peering](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-network-manage-peering)
- [Terraform AzureRM virtual network peering](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_network_peering)

## Tutor record

- Outcome: In progress
- Help used: Not yet assessed
- Next action: Predict how many directional peering resources are required and
  explain why before creating files or Azure resources.
