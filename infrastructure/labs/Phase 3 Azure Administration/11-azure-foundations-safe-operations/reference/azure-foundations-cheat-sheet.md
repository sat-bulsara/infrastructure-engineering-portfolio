# Azure Foundations Cheat Sheet

## Management Hierarchy

```text
Microsoft Entra tenant
└── Management group, when used
    └── Subscription
        └── Resource group
            └── Resource
```

- **Tenant:** Microsoft Entra ID identity boundary containing identities, groups,
  applications and authentication settings.
- **Management group:** optional governance scope above subscriptions.
- **Subscription:** billing, quota and resource-management boundary.
- **Resource group:** lifecycle and management container for related resources.
- **Resource:** manageable service instance, such as a virtual network or VM.

A tenant can have multiple subscriptions. Every Azure resource belongs to a
subscription and normally one resource group.

## Azure Planes

- **Identity plane:** authenticates identities and issues tokens.
- **Control plane:** creates, changes, queries and deletes Azure resources
  through Azure Resource Manager.
- **Data plane:** accesses the service or data inside a resource.

A management lock affects control-plane operations. It does not replace RBAC or
data-plane permissions.

## Tag, Lock, Policy and RBAC

| Control | Question | Does | Does not |
| --- | --- | --- | --- |
| Tag | What is this for? | Adds searchable metadata | Enforce a rule alone |
| Lock | Which changes must be blocked? | Prevents deletion or modification | Grant access |
| Policy | Is this allowed or compliant? | Audits or enforces rules | Replace permissions |
| RBAC | Who can do what at which scope? | Grants actions to identities | Prevent every authorised mistake |

## Management Locks

| Portal | Command line | Effect |
| --- | --- | --- |
| Delete | `CanNotDelete` | Read and modify allowed, deletion blocked |
| Read-only | `ReadOnly` | Read allowed, modification and deletion blocked |

- Locks apply at subscription, resource-group or resource scope.
- Child resources inherit parent locks.
- The most restrictive applicable lock wins.
- Locks restrict even authorised users for the blocked operation.
- Remove locks deliberately before cleanup.

## Budgets and Cost

- A budget compares evaluated cost with a configured amount.
- A threshold can trigger a notification.
- A budget does **not** automatically stop consumption.
- Cost data and budget evaluation are not real-time.
- A stopped VM can still incur charges. Deallocate it to stop compute billing,
  then assess disks, IPs and other attached resources.

## Cloud Service Models

| Model | Customer manages more of | Provider manages more of | Example |
| --- | --- | --- | --- |
| IaaS | OS, apps, data and configuration | Hardware and virtualisation | Azure VMs |
| PaaS | App, data and service settings | OS, runtime and platform | App Service |
| SaaS | Users, data use and settings | App and platform | Microsoft 365 |

Shared responsibility changes with the model. Identities, data handling and
configuration still remain customer concerns.

## Scale and Availability

- **Scalability:** ability to increase or decrease capacity.
- **Elasticity:** capacity changes in response to demand.
- **High availability:** design that maintains service through failures.
- **Resilience:** ability to withstand and recover from disruption.
- **Region:** Azure geographic area containing datacentres.
- **Availability zone:** physically separate datacentre grouping in a supported
  region with independent power, cooling and networking.
- **Region pair:** platform pairing used for some recovery and rollout choices.
  It does not automatically make every workload resilient.

## Azure Resource Manager and Providers

- Azure Resource Manager is Azure's control-plane management layer.
- A resource ID identifies a resource and its scope.
- A provider supplies resource types, for example
  `Microsoft.Compute/virtualMachines`.
- Register a provider when the intended service requires it, not blindly to hide
  an error.

## Context Safety Check

```text
Identity -> Tenant -> Subscription -> Scope -> Region
         -> Permission -> Cost -> Cleanup path
```

Portal, CLI, PowerShell and Terraform each maintain or consume context. Checking
one does not prove another terminal is targeting the same subscription.

## Naming Pattern

```text
rg-<workload>-<environment>-<region>-<instance>
rg-azure-foundations-lab-uks-01
```

## Troubleshooting Order

```text
Authentication
-> tenant and subscription
-> resource scope and name
-> permission or policy
-> region and quota
-> provider registration
-> live verification
```

Change one thing at a time, then repeat a read-only query.

## Azure Recall Prompts

1. Why can an Owner still be blocked from deleting a locked group?
2. What happens when a budget threshold is exceeded?
3. Which control helps find resources with a specific expiry date?
4. Why check the subscription again after reauthentication?
5. How do `CanNotDelete` and `ReadOnly` differ?
6. Why is an expiry tag not a cleanup mechanism by itself?
