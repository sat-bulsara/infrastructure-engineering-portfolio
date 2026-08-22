# Phase 3: Azure Administration and AZ-104 Roadmap

> Goal: Build, secure, operate, automate, troubleshoot, and explain the Azure infrastructure services expected of an Azure Administrator.

This roadmap is aligned to the Microsoft AZ-104 skills measured from 17 April 2026. Check the official study guide again before booking the exam because Microsoft updates certification objectives periodically.

- [Official AZ-104 study guide](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104)
- [Azure Administrator certification page](https://learn.microsoft.com/en-us/credentials/certifications/azure-administrator/)
- [Stateful AZ-104 companion](../learning/az-104/)

## What This Roadmap Does

The roadmap has two connected tracks:

1. **Azure and cloud engineering path:** broad understanding, practical administration, automation, troubleshooting, and evidence.
2. **AZ-104 readiness:** a useful checkpoint that sits inside the wider learning path rather than being its only purpose.

The path is intentionally progressive. Each build reuses knowledge and resources from earlier builds. There is no target exam date and no requirement to finish in a fixed number of weeks.

## Mastery-Based Sequence

| Stage | Focus | Builds | Move on when |
| --- | --- | --- | --- |
| A | Cloud foundations, identity, governance, and safe operation | 11-13 | You can explain the Azure hierarchy, access, policy, cost, and shared responsibility |
| B | Core infrastructure services | 14-16 | You can build, secure, verify, and repair networking, storage, and compute |
| C | Repeatable deployment and platform workloads | 17-18 | You can read infrastructure as code and choose between VM, app, and container services |
| D | Operations, resilience, and troubleshooting | 19-21 | You can diagnose from evidence, monitor workloads, and prove recovery |
| E | Integrated cloud engineering | 22 | You can design and rebuild a small environment with decreasing help |
| F | Optional specialisation and portfolio work | Extensions A-E | The extension builds on demonstrated core knowledge |
| G | AZ-104 assessment | Exam readiness | You feel confident and the evidence-based readiness gate is complete |

## How Microsoft Learn, Timothy Warner, and Your Labs Work Together

For each topic, use the sources in this order:

1. **Microsoft Learn:** establish accurate concepts and complete the official modules.
2. **Companion drill:** retrieve the idea and complete one small guided task.
3. **Your lab:** build, verify, break, fix, explain, document, and clean up.
4. **Timothy Warner lab:** repeat or vary the topic for extra guided practice where a completed lab is available.
5. **Automation:** reproduce the understood service with PowerShell, Azure CLI, Bicep, Terraform, or Python when the tool adds value.

Timothy Warner's repository is a useful supplement, especially for lab structure, quick reference, troubleshooting, and scenario practice. Some labs listed in its index are marked as coming soon, so the companion must check that a lab actually exists before assigning it.

### Official Microsoft Learn Paths

- [AZ-104 prerequisites for Azure administrators](https://learn.microsoft.com/en-us/training/paths/az-104-administrator-prerequisites/)
- [Manage identities and governance in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-identities-governance/)
- [Implement and manage storage in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-storage/)
- [Deploy and manage Azure compute resources](https://learn.microsoft.com/en-us/training/paths/az-104-manage-compute-resources/)
- [Configure and manage virtual networks](https://learn.microsoft.com/en-us/training/paths/az-104-manage-virtual-networks/)
- [Monitor and back up Azure resources](https://learn.microsoft.com/en-us/training/paths/az-104-monitor-backup-resources/)

### Timothy Warner Resources

- [AZ-104 repository](https://github.com/timothywarner/az104)
- [Hands-on lab index](https://github.com/timothywarner/az104/tree/main/labs)
- [Identity and governance labs](https://github.com/timothywarner/az104/tree/main/labs/identity-governance)
- [Storage labs](https://github.com/timothywarner/az104/tree/main/labs/storage)
- [Networking labs](https://github.com/timothywarner/az104/tree/main/labs/networking)
- [Quick-reference material](https://github.com/timothywarner/az104/tree/main/quick-reference)
- [Troubleshooting scenarios](https://github.com/timothywarner/az104/tree/main/troubleshooting)
- [Practice questions](https://github.com/timothywarner/az104/tree/main/practice-questions)

## Learning Loop for Every Build

Use the same sequence throughout the phase:

`retrieve -> research -> guided drill -> portal build -> verify -> break -> troubleshoot -> automate -> explain -> document -> clean up`

A checked box records completion, not mastery. Mastery requires successful verification, an explanation in your own words, and later recall.

## Anti-Overwhelm Rules

- Keep only one build and one small concept active at a time.
- Learn the reason for a service before memorising commands for it.
- Do not use the portal, PowerShell, Azure CLI, Terraform, and Python in the same first session.
- Finish a small verified outcome, record it, and stop at a natural checkpoint.
- Revisit difficult ideas through spaced retrieval and a changed scenario.
- Ask for help after a focused attempt instead of going round in circles.
- Treat an error as diagnostic evidence, not as proof that you cannot learn the topic.

## Tool Progression

| Stage | Primary method | Purpose |
| --- | --- | --- |
| 1 | Azure portal | Learn the resource model and see each setting |
| 2 | Read-only PowerShell and Azure CLI | Inspect state and verify the portal build |
| 3 | PowerShell or Azure CLI deployment | Repeat selected operations without the portal |
| 4 | ARM and Bicep | Meet the AZ-104 infrastructure-as-code objectives |
| 5 | Terraform | Rebuild services that are already understood and create reusable project infrastructure |
| 6 | Python | Add inventory, reporting, SDK, validation, or operational automation where it provides a clear benefit |

Do not deploy every lab with every tool. First understand the service manually, then choose the automation method that teaches something useful. Terraform and Python are part of the broader cloud-engineering path. ARM templates and Bicep remain essential because they are named in the current AZ-104 outline.

## Security, Cost, and Evidence Guardrails

Before every deployment:

- [ ] Confirm the active tenant and subscription.
- [ ] Use a dedicated lab resource group and consistent tags.
- [ ] Estimate the likely cost and define the cleanup step.
- [ ] Use the smallest suitable SKU and avoid unnecessary public endpoints.
- [ ] Use least privilege and a separate administrative identity where available.
- [ ] Keep passwords, tokens, access keys, tenant IDs, subscription IDs, and recovery material out of Git.
- [ ] Review screenshots before publishing them.

For every completed lab, retain:

- [ ] A short business scenario and architecture diagram where useful.
- [ ] Implementation evidence.
- [ ] Independent verification evidence.
- [ ] One controlled failure and the diagnostic path used to fix it.
- [ ] Security, cost, limitations, and cleanup notes.
- [ ] A short explanation of why the chosen configuration was appropriate.

# Progressive Azure and AZ-104 Core Path

## Build 11: Azure Foundations and Safe Lab Operations

### Outcome

Navigate Azure safely, understand the management hierarchy, use the portal and command-line tools, and prevent accidental cost or resource loss.

### Guided Learning

- [Microsoft Learn: AZ-104 prerequisites for Azure administrators](https://learn.microsoft.com/en-us/training/paths/az-104-administrator-prerequisites/)
- [Timothy Warner: study plans](https://github.com/timothywarner/az104/blob/main/STUDY-PLAN.md)

### Learn

- [ ] Shared responsibility and the differences between IaaS, PaaS, and SaaS
- [ ] Consumption pricing, elasticity, scalability, resilience, and high availability
- [ ] The Azure control plane, data plane, identity plane, and management hierarchy
- [ ] Tenants, subscriptions, resource groups, and resources
- [ ] Azure regions, region pairs, and availability zones
- [ ] Azure Resource Manager and resource providers
- [ ] Azure portal and Cloud Shell
- [ ] Azure CLI and Azure PowerShell contexts
- [ ] Naming conventions, tags, locks, budgets, and cost alerts

### Build

- [ ] Confirm the correct tenant and subscription before making changes.
- [ ] Create a dedicated AZ-104 lab resource group.
- [ ] Apply a naming convention and tags for owner, environment, workload, and expiry date.
- [ ] Configure a small monthly budget and notification threshold.
- [ ] Apply and test a delete lock on a disposable resource or resource group.
- [ ] Register a resource provider only if a later build requires it.

### Automate and Extend

- [ ] Use read-only Azure CLI and Azure PowerShell commands to inspect the portal build.
- [ ] Recreate the resource group, tags, and lock with Terraform after the manual workflow is understood.
- [ ] Use Python with the Azure SDK or Azure CLI JSON output to produce a small resource inventory.
- [ ] Compare imperative commands with declarative Terraform state.

### Verify

- [ ] Inspect the active context in the portal, Azure CLI, and Azure PowerShell.
- [ ] Query the resource group, tags, lock, budget, and activity log.
- [ ] Confirm that the delete lock prevents deletion, then remove it safely.

### Break and Fix

- [ ] Select the wrong subscription context, recognise the mismatch, and restore the intended context before deployment.
- [ ] Diagnose a resource deployment blocked by an unavailable region, naming rule, quota, policy, or provider registration.

### Evidence and Exit Gate

- [ ] Publish a short lab README and naming standard.
- [ ] Record the cleanup procedure and expected cost.
- [ ] Explain the relationship between tenant, subscription, resource group, and resource without notes.
- [ ] Explain the difference between a tag, lock, and policy.

## Build 12: Microsoft Entra ID and Azure RBAC

### Outcome

Manage identities and assign access at the correct Azure scope using least privilege.

### Guided Learning

- [Microsoft Learn: Manage identities and governance in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-identities-governance/)
- [Timothy Warner: Managing Microsoft Entra ID users and groups](https://github.com/timothywarner/az104/blob/main/labs/identity-governance/lab01-entra-id-users-groups.md)
- [Timothy Warner: Azure RBAC and resource access](https://github.com/timothywarner/az104/blob/main/labs/identity-governance/lab02-rbac-resource-access.md)

### Existing Evidence

- [x] Completed the guided [Group-Based RBAC lab](../practice/01-group-based-rbac/README.md).
- [ ] Repeat the core RBAC workflow later without step-by-step help.

### Learn

- [ ] Users, groups, group properties, and membership types
- [ ] User and group licence assignment
- [ ] External users and business-to-business collaboration
- [ ] Self-service password reset
- [ ] Azure RBAC roles, scopes, inheritance, and effective access
- [ ] Microsoft Entra roles compared with Azure resource roles

### Build

- [ ] Create test users and security groups.
- [ ] Manage user and group properties and membership.
- [ ] Invite an external test user where the tenant permits it.
- [ ] Configure SSPR and licence assignment where licensing permits it.
- [ ] Assign a built-in Azure role to a group at resource-group scope.
- [ ] Compare the same role assigned at subscription and resource scope.

### Automate and Extend

- [ ] Repeat selected user, group, and role queries with Microsoft Graph PowerShell and Azure CLI.
- [ ] Manage suitable group and Azure role assignments with Terraform only after the scopes are understood.
- [ ] Use Python and Microsoft Graph to produce a public-safe user, group, or role-membership report.
- [ ] Never place passwords, client secrets, access tokens, tenant IDs, or object IDs in committed examples.

### Verify

- [ ] Use Check access and command-line queries to interpret effective assignments.
- [ ] Test allowed and denied actions with a non-administrator test identity.
- [ ] Confirm that removing group membership removes inherited access after propagation.

### Break and Fix

- [ ] Assign the wrong role or scope, diagnose the effective access, and correct it.
- [ ] Remove a required group membership, identify the cause of the access failure, and restore it.

### Evidence and Exit Gate

- [ ] Publish an RBAC matrix showing identity, role, scope, and business reason.
- [ ] Explain why group-based role assignment is usually preferable to direct user assignment.
- [ ] Create a correct least-privilege role assignment without instructions.

## Build 13: Governance and Landing-Zone Controls

### Outcome

Create a small, secure governance baseline that controls organisation, compliance, and cost.

### Guided Learning

- [Microsoft Learn: Manage identities and governance in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-identities-governance/)
- [Timothy Warner: Identity and governance lab index](https://github.com/timothywarner/az104/tree/main/labs/identity-governance)

### Learn

- [ ] Management groups and subscription organisation
- [ ] Azure Policy definitions, assignments, initiatives, effects, and compliance
- [ ] Resource groups, tags, and resource locks
- [ ] Budgets, cost alerts, Cost Management, and Azure Advisor recommendations
- [ ] Policy scope, exclusions, remediation, and managed identities

### Build

- [ ] Design a small management-group and subscription hierarchy on paper.
- [ ] Implement the hierarchy if the lab tenant permissions allow it.
- [ ] Create resource groups for shared, application, and management resources.
- [ ] Assign built-in policies for allowed locations and required tags.
- [ ] Create a small policy initiative.
- [ ] Review compliance and remediate a deliberately non-compliant resource.
- [ ] Apply a resource lock and configure a budget alert.
- [ ] Review relevant Azure Advisor recommendations.

### Automate and Extend

- [ ] Query policy, compliance, locks, tags, budgets, and recommendations with Azure CLI and Azure PowerShell.
- [ ] Recreate suitable governance controls with Terraform after testing them manually.
- [ ] Use Python to summarise tag coverage, policy compliance, or cost data into a report.
- [ ] Keep organisation-wide or destructive changes out of a shared tenant unless explicitly authorised.

### Verify

- [ ] Confirm policy inheritance and effective assignments at each scope.
- [ ] Prove that a denied deployment fails for the intended policy reason.
- [ ] Confirm tags, locks, compliance results, and budget configuration.

### Break and Fix

- [ ] Introduce a missing tag and repair the compliance state.
- [ ] Diagnose a deployment blocked by policy.
- [ ] Identify why a locked resource cannot be deleted and remove the lock only after approval.

### Evidence and Exit Gate

- [ ] Publish a landing-zone diagram, naming standard, policy table, and cost controls.
- [ ] Explain why this is a learning landing zone rather than a production enterprise landing zone.
- [ ] Explain the difference between management groups, subscriptions, and resource groups.

## Build 14: Virtual Networking and Secure Access

### Outcome

Build segmented Azure networks, control traffic, connect networks, and secure administrative access.

### Guided Learning

- [Microsoft Learn: Configure and manage virtual networks](https://learn.microsoft.com/en-us/training/paths/az-104-manage-virtual-networks/)
- [Timothy Warner: Virtual networks and NSGs](https://github.com/timothywarner/az104/blob/main/labs/networking/lab01-virtual-networks-nsg.md)

### Learn

- [ ] Virtual networks, subnets, address spaces, and subnet planning
- [ ] Public and private IP addresses
- [ ] VNet peering and peering options
- [ ] Network security groups and application security groups
- [ ] Effective security rules
- [ ] User-defined routes and route tables
- [ ] Azure Bastion
- [ ] Service endpoints and private endpoints
- [ ] Azure DNS and private DNS zones

### Build

- [ ] Design non-overlapping address spaces.
- [ ] Create hub and spoke VNets with dedicated subnets.
- [ ] Configure peering and test connected and isolated states.
- [ ] Create NSGs and ASGs and apply least-privilege rules.
- [ ] Create and associate a route table.
- [ ] Configure Azure Bastion or document the cost-aware alternative used in the lab.
- [ ] Configure public and private DNS records.
- [ ] Prepare subnets for service and private endpoints used in Build 15.

### Automate and Extend

- [ ] Inspect VNets, routes, peerings, NSGs, and effective rules with Azure CLI and Azure PowerShell.
- [ ] Rebuild the network with Terraform modules after the packet path is understood.
- [ ] Use Python's `ipaddress` module to validate CIDR ranges and detect overlaps.
- [ ] Generate an NSG or route inventory with Python where it improves visibility.

### Verify

- [ ] Review effective security rules and effective routes.
- [ ] Test allowed and denied traffic paths.
- [ ] Verify peering status and DNS resolution.
- [ ] Confirm that management access does not require an unrestricted public RDP or SSH rule.

### Break and Fix

- [ ] Block a required port with an NSG and identify the effective rule.
- [ ] Add an incorrect route and restore connectivity.
- [ ] Break peering or DNS configuration and diagnose it systematically.

### Evidence and Exit Gate

- [ ] Publish an address plan, network diagram, NSG matrix, and test results.
- [ ] Explain NSGs compared with ASGs and service endpoints compared with private endpoints.
- [ ] Calculate a subnet range without relying entirely on the portal.

## Build 15: Secure Azure Storage

### Outcome

Deploy Blob Storage and Azure Files with appropriate resilience, data protection, identity, and network controls.

### Guided Learning

- [Microsoft Learn: Implement and manage storage in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-storage/)
- [Timothy Warner: Storage accounts and Blob Storage](https://github.com/timothywarner/az104/blob/main/labs/storage/lab01-storage-accounts-blob.md)
- [Microsoft Applied Skills: Secure storage for Azure Files and Azure Blob Storage](https://learn.microsoft.com/en-us/credentials/applied-skills/secure-storage-azure-files-azure-blob-storage/)

### Learn

- [ ] Storage-account types, performance tiers, and redundancy options
- [ ] Access keys, shared access signatures, and stored access policies
- [ ] Identity-based access for Azure Files
- [ ] Storage firewalls, virtual networks, service endpoints, and private endpoints
- [ ] Microsoft-managed and customer-managed encryption options
- [ ] Blob containers, access tiers, lifecycle management, soft delete, and versioning
- [ ] Azure Files shares, snapshots, and soft delete
- [ ] Object replication
- [ ] Azure Storage Explorer and AzCopy

### Build

- [ ] Create a general-purpose v2 storage account with secure transfer required.
- [ ] Compare LRS, ZRS, GRS, and GZRS and select one for the lab scenario.
- [ ] Create a private blob container and an Azure file share.
- [ ] Configure identity-based access where the lab environment supports it.
- [ ] Generate a time-limited, least-privilege SAS and relate it to a stored access policy.
- [ ] Configure storage firewall rules and a private endpoint.
- [ ] Configure blob lifecycle management, versioning, and soft delete.
- [ ] Configure Azure Files snapshots and soft delete.
- [ ] Configure object replication if two suitable accounts are available.
- [ ] Transfer test data with Storage Explorer and AzCopy.

### Automate and Extend

- [ ] Query and administer the storage service with Azure CLI and Azure PowerShell.
- [ ] Rebuild the account, data services, protection, networking, and role assignments with Terraform where supported.
- [ ] Use the Azure Storage SDK for Python to upload, download, list, and safely delete test data.
- [ ] Create a Python report for container, share, lifecycle, versioning, or protection configuration.

### Verify

- [ ] Test authorised and unauthorised access paths.
- [ ] Confirm DNS resolution and private-endpoint connectivity.
- [ ] Recover a deleted or previous-version test object.
- [ ] Confirm lifecycle, encryption, redundancy, and replication settings.

### Break and Fix

- [ ] Diagnose an expired or over-restricted SAS.
- [ ] Break storage network access and identify the firewall, DNS, or endpoint cause.
- [ ] Remove a role assignment and restore identity-based access.

### Evidence and Exit Gate

- [ ] Publish a storage diagram, access matrix, recovery test, and cleanup record.
- [ ] Explain when to use an access key, SAS, stored access policy, or Microsoft Entra identity.
- [ ] Complete the [Secure storage for Azure Files and Azure Blob Storage](https://learn.microsoft.com/en-us/credentials/applied-skills/secure-storage-azure-files-azure-blob-storage/) learning path or assessment when ready.

## Build 16: Azure Virtual Machines and Resilience

### Outcome

Deploy, secure, resize, move, and recover Windows and Linux virtual machines.

### Guided Learning

- [Microsoft Learn: Deploy and manage Azure compute resources](https://learn.microsoft.com/en-us/training/paths/az-104-manage-compute-resources/)
- [Timothy Warner: Hands-on lab index](https://github.com/timothywarner/az104/tree/main/labs)

### Learn

- [ ] VM images, sizes, network interfaces, public IPs, and managed disks
- [ ] Availability sets and availability zones
- [ ] Virtual Machine Scale Sets and scaling
- [ ] OS and data-disk management
- [ ] Encryption at host
- [ ] VM moves between resource groups, subscriptions, and regions
- [ ] Secure administration with Bastion, RDP, and SSH

### Build

- [ ] Deploy one Windows VM and one Linux VM with no unnecessary inbound access.
- [ ] Connect through Bastion or a documented secure alternative.
- [ ] Add, initialise, resize, snapshot, and detach a managed data disk.
- [ ] Resize a VM and compare size availability by region.
- [ ] Deploy VMs across an availability set or availability zones.
- [ ] Configure encryption at host where the subscription and VM support it.
- [ ] Deploy and scale a small VM Scale Set.
- [ ] Move a disposable VM or supporting resource between resource groups.
- [ ] Document the supported method for subscription and regional moves.

### Automate and Extend

- [ ] Manage VM lifecycle, sizes, disks, and status with Azure CLI and Azure PowerShell.
- [ ] Rebuild a secure VM and supporting resources with Terraform.
- [ ] Use Python to inventory VM size, power state, disks, network exposure, and tags.
- [ ] Compare Bicep and Terraform representations after Build 17.

### Verify

- [ ] Confirm VM power state, agent status, size, disk configuration, and network path.
- [ ] Verify zone or availability-set placement.
- [ ] Test scaling behaviour and access to the workload.

### Break and Fix

- [ ] Block management access with an NSG and restore it using evidence.
- [ ] Diagnose boot or disk attachment failure.
- [ ] Select an unavailable size and determine the quota or regional constraint.

### Evidence and Exit Gate

- [ ] Publish a VM diagram, configuration table, security decisions, and cost note.
- [ ] Explain availability sets compared with zones and a single VM compared with a scale set.
- [ ] Restore VM access without opening unrestricted RDP or SSH to the internet.

## Build 17: ARM Templates and Bicep

### Outcome

Read, modify, export, convert, deploy, and troubleshoot Azure infrastructure as code using the technologies named in the AZ-104 outline.

### Guided Learning

- [Microsoft Learn: Deploy and manage Azure compute resources](https://learn.microsoft.com/en-us/training/paths/az-104-manage-compute-resources/)
- [Microsoft Learn: Bicep documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Timothy Warner: Sample landing zone](https://github.com/timothywarner/az104/tree/main/az104-sample-landing-zone)

### Learn

- [ ] ARM template structure, parameters, variables, functions, resources, dependencies, and outputs
- [ ] Bicep syntax, parameters, modules, symbolic names, and outputs
- [ ] Incremental deployment, what-if, deployment history, and common errors

### Build

- [ ] Export an existing portal deployment as an ARM template.
- [ ] Interpret the exported template and identify unsafe or environment-specific values.
- [ ] Modify and redeploy an existing ARM template.
- [ ] Convert or recreate the deployment in Bicep.
- [ ] Split the Bicep solution into reusable modules.
- [ ] Deploy the solution with parameters and inspect the deployment history.
- [ ] Run a what-if operation before changing an existing environment.

### Automate and Extend

- [ ] Recreate a small Bicep deployment in Terraform and compare syntax, state, planning, and drift behaviour.
- [ ] Use Python only where it adds a useful validation, inventory, or deployment-reporting step.
- [ ] Keep generated ARM templates as learning material, then refactor them before treating them as reusable code.

### Verify

- [ ] Compare deployed state with the template and parameters.
- [ ] Confirm outputs and idempotent redeployment.
- [ ] Validate that secrets and tenant-specific identifiers are not committed.

### Break and Fix

- [ ] Introduce a syntax error, dependency error, invalid API version, or naming failure.
- [ ] Use validation and deployment-operation details to locate the cause.

### Evidence and Exit Gate

- [ ] Publish parameterised Bicep, an architecture diagram, and safe deployment instructions.
- [ ] Modify an unfamiliar small Bicep file without step-by-step instructions.
- [ ] Explain why Terraform remains a later portfolio tool rather than a substitute for this build.

## Build 18: App Service and Containers

### Outcome

Deploy and operate platform-hosted web applications and container workloads.

### Guided Learning

- [Microsoft Learn: Deploy and manage Azure compute resources](https://learn.microsoft.com/en-us/training/paths/az-104-manage-compute-resources/)
- [Timothy Warner: Hands-on lab index](https://github.com/timothywarner/az104/tree/main/labs)

### Learn

- [ ] App Service plans, pricing tiers, scaling, deployment slots, backups, and networking
- [ ] TLS certificates and custom DNS names
- [ ] Azure Container Registry
- [ ] Azure Container Instances
- [ ] Azure Container Apps
- [ ] Container sizing, revisions, ingress, and scaling

### Build

- [ ] Create an App Service plan and web app.
- [ ] Configure application settings, scaling, networking, and backup.
- [ ] Create and swap a deployment slot.
- [ ] Configure HTTPS and, where available, a custom DNS name and certificate.
- [ ] Build or use a safe sample container image and store it in ACR.
- [ ] Deploy the image to ACI and Azure Container Apps.
- [ ] Configure Container Apps revisions, ingress, sizing, and scaling.

### Automate and Extend

- [ ] Repeat selected administration with Azure CLI and Azure PowerShell.
- [ ] Deploy App Service, ACR, and Container Apps infrastructure with Terraform after the manual build works.
- [ ] Use a small Python application or script to demonstrate configuration, managed identity, logging, or an Azure SDK call.
- [ ] Keep application coding secondary to understanding the Azure hosting and operations model.

### Verify

- [ ] Confirm application health, HTTPS, environment settings, slot behaviour, and backup state.
- [ ] Confirm container image, registry access, revision, ingress, and scale configuration.

### Break and Fix

- [ ] Break an application setting, registry permission, health check, or network rule.
- [ ] Diagnose the failure using logs and resource configuration.

### Evidence and Exit Gate

- [ ] Publish an App Service and container comparison with evidence from both deployments.
- [ ] Explain when a VM, App Service, ACI, or Container Apps solution is appropriate.
- [ ] Clean up continuously billed compute resources.

## Build 19: Load Balancing and Network Troubleshooting

### Outcome

Distribute traffic, configure name resolution, and diagnose Azure network failures using platform tools.

### Guided Learning

- [Microsoft Learn: Configure and manage virtual networks](https://learn.microsoft.com/en-us/training/paths/az-104-manage-virtual-networks/)
- [Timothy Warner: Virtual networks and NSGs](https://github.com/timothywarner/az104/blob/main/labs/networking/lab01-virtual-networks-nsg.md)
- [Timothy Warner: Troubleshooting scenarios](https://github.com/timothywarner/az104/tree/main/troubleshooting)
- [Microsoft Applied Skills: Configure secure access using Azure networking](https://learn.microsoft.com/en-us/credentials/applied-skills/configure-secure-workloads-use-azure-virtual-networking/)

### Learn

- [ ] Public and internal Azure Load Balancer
- [ ] Front-end IPs, backend pools, health probes, and load-balancing rules
- [ ] Azure DNS records and private DNS links
- [ ] Network Watcher, IP flow verify, next hop, effective routes, and effective NSG rules
- [ ] Connection Monitor and connection troubleshooting

### Build

- [ ] Place two small web workloads behind a load balancer.
- [ ] Configure backend pools, a health probe, and a load-balancing rule.
- [ ] Test an internal or public front end appropriate to the scenario.
- [ ] Configure Azure DNS or private DNS for the service.
- [ ] Configure Network Watcher and Connection Monitor.

### Automate and Extend

- [ ] Query and test the packet path with Azure CLI and Azure PowerShell.
- [ ] Rebuild the load balancer, DNS, and monitoring resources with Terraform where useful.
- [ ] Use Python to validate DNS results, address plans, backend inventory, or network configuration data.

### Verify

- [ ] Confirm healthy backends and traffic distribution.
- [ ] Test name resolution and the complete source-to-destination path.
- [ ] Record effective rules, routes, and connection-monitor results.

### Break and Fix

- [ ] Break a health probe, NSG rule, route, DNS record, or backend configuration.
- [ ] Diagnose the failure from symptoms to root cause without changing multiple settings at once.

### Evidence and Exit Gate

- [ ] Publish a packet-path diagram and structured troubleshooting record.
- [ ] Explain the role of the front end, backend pool, probe, and rule.
- [ ] Complete the [Configure secure access to your workloads using Azure networking](https://learn.microsoft.com/en-us/credentials/applied-skills/configure-secure-workloads-use-azure-virtual-networking/) learning path or assessment when ready.

## Build 20: Azure Monitor and Operational Response

### Outcome

Collect, query, visualise, and act on Azure platform and workload telemetry.

### Guided Learning

- [Microsoft Learn: Monitor and back up Azure resources](https://learn.microsoft.com/en-us/training/paths/az-104-monitor-backup-resources/)
- [Timothy Warner: Troubleshooting scenarios](https://github.com/timothywarner/az104/tree/main/troubleshooting)
- [Microsoft Applied Skills: Deploy and configure Azure Monitor](https://learn.microsoft.com/en-us/credentials/applied-skills/deploy-and-configure-azure-monitor/)

### Learn

- [ ] Azure Monitor metrics, logs, activity logs, and diagnostic settings
- [ ] Log Analytics workspaces and KQL fundamentals
- [ ] Alert rules, action groups, and alert processing rules
- [ ] Azure Monitor Insights for VMs, storage accounts, and networks
- [ ] Workbooks and dashboards

### Build

- [ ] Create a Log Analytics workspace.
- [ ] Configure diagnostic settings for representative resources.
- [ ] Enable appropriate VM, storage, and network monitoring.
- [ ] Write KQL queries that filter, summarise, and visualise collected data.
- [ ] Create metric and log alerts with an action group.
- [ ] Configure an alert processing rule.
- [ ] Build a small workbook or dashboard.

### Automate and Extend

- [ ] Query monitoring configuration and logs with Azure CLI, Azure PowerShell, and KQL.
- [ ] Deploy diagnostic settings, workspaces, alerts, and action groups with Terraform where supported.
- [ ] Use Python to query monitoring data or produce an operational report.
- [ ] Keep alerts routed to safe lab destinations and avoid publishing personal contact details.

### Verify

- [ ] Confirm expected logs and metrics arrive.
- [ ] Trigger a safe test condition and confirm the alert and action group fire.
- [ ] Interpret VM, storage, and network insights.

### Break and Fix

- [ ] Remove or misconfigure a diagnostic setting and identify the collection gap.
- [ ] Suppress an alert unintentionally and locate the alert processing rule.
- [ ] Fix an incorrect KQL filter or time range.

### Evidence and Exit Gate

- [ ] Publish monitoring coverage, sample KQL, alert evidence, and limitations.
- [ ] Explain metrics compared with logs and activity logs compared with resource logs.
- [ ] Complete the [Deploy and configure Azure Monitor](https://learn.microsoft.com/en-us/credentials/applied-skills/deploy-and-configure-azure-monitor/) learning path or assessment when ready.

## Build 21: Azure Backup and Disaster Recovery

### Outcome

Protect Azure workloads, restore lost data, and test regional recovery.

### Guided Learning

- [Microsoft Learn: Monitor and back up Azure resources](https://learn.microsoft.com/en-us/training/paths/az-104-monitor-backup-resources/)
- [Timothy Warner: Hands-on lab index](https://github.com/timothywarner/az104/tree/main/labs)
- [Timothy Warner: Troubleshooting scenarios](https://github.com/timothywarner/az104/tree/main/troubleshooting)

### Learn

- [ ] Recovery Services vaults and Backup vaults
- [ ] Backup policies, retention, restore points, reports, and alerts
- [ ] VM backup and restore operations
- [ ] Azure Site Recovery replication, test failover, failover, and reprotection
- [ ] Recovery objectives and the difference between backup and disaster recovery

### Build

- [ ] Create the appropriate vaults for the selected workloads.
- [ ] Configure a VM backup policy and complete an on-demand backup.
- [ ] Restore files and a disposable VM or disk.
- [ ] Configure backup reports and alerts.
- [ ] Configure Site Recovery for a supported disposable workload.
- [ ] Perform a test failover and document the isolated validation network.
- [ ] Document failover, commit, reprotection, and failback even where lab cost limits full execution.

### Automate and Extend

- [ ] Inspect jobs, recovery points, policies, vaults, and replication health with Azure CLI and Azure PowerShell.
- [ ] Recreate supported vaults and policies with Terraform after the recovery workflow is understood.
- [ ] Use Python to report backup coverage, failed jobs, recovery points, or policy compliance.
- [ ] Do not automate deletion of recovery data until retention and recovery implications are understood.

### Verify

- [ ] Confirm backup jobs, recovery points, restored data, and alert state.
- [ ] Confirm the test-failover workload starts without affecting production state.

### Break and Fix

- [ ] Diagnose a failed backup caused by policy, permissions, extension, or connectivity.
- [ ] Identify why replication health is warning or critical.

### Evidence and Exit Gate

- [ ] Publish a recovery runbook with actual restore evidence.
- [ ] Explain recovery point objective, recovery time objective, backup, and Site Recovery.
- [ ] Clean up replicated and restored resources to control cost.

## Build 22: Integrated Azure Administrator Capstone

### Outcome

Build and operate a small Azure environment that joins the major AZ-104 domains into one coherent scenario.

### Guided Learning

- Revisit the relevant Microsoft Learn paths for weak areas.
- Use [Timothy Warner's quick-reference](https://github.com/timothywarner/az104/tree/main/quick-reference), [troubleshooting](https://github.com/timothywarner/az104/tree/main/troubleshooting), and [practice-question](https://github.com/timothywarner/az104/tree/main/practice-questions) collections for varied retrieval.

### Scenario

A small organisation needs a governed Azure environment containing identities, segmented networking, secure storage, compute or an application workload, monitoring, backup, and documented recovery procedures.

### Build

- [ ] Create the environment manually through the portal first.
- [ ] Use group-based RBAC and governance controls.
- [ ] Deploy segmented networking and secure administrative access.
- [ ] Deploy secure storage and a compute or application workload.
- [ ] Configure monitoring, alerting, backup, and recovery.
- [ ] Rebuild the repeatable infrastructure with Bicep.
- [ ] Use Azure CLI and PowerShell for verification and selected administrative operations.
- [ ] Rebuild suitable capstone resources with Terraform after the Bicep version is understood.
- [ ] Add one useful Python inventory, validation, or operational-reporting tool.
- [ ] Inject at least three faults across different exam domains and troubleshoot them independently.

### Evidence and Exit Gate

- [ ] Architecture and data-flow diagrams
- [ ] Security and RBAC decisions
- [ ] Bicep and parameter files with no secrets
- [ ] Verification output and screenshots
- [ ] Troubleshooting records with symptoms, hypothesis, evidence, cause, fix, and retest
- [ ] Cost estimate and cleanup evidence
- [ ] A five-minute explanation delivered without reading the README
- [ ] A rebuild or major repair completed without step-by-step instructions

# Optional AZ-104 Confidence Checkpoint

Use this checkpoint after the core path, or later when you decide that sitting the
exam would be useful. It does not block continued Azure or portfolio learning.

## Official Study

- [ ] Complete the current Microsoft Learn AZ-104 learning paths.
- [ ] Map every current skills-measured item to lab evidence or a reviewed knowledge note.
- [ ] Review the official study guide again shortly before the exam.
- [ ] Use the Microsoft exam sandbox to learn the question interface.

## Retrieval and Practice

- [ ] Complete mixed scenario questions without notes.
- [ ] Review every incorrect answer and state why each alternative was wrong.
- [ ] Repeat weak labs using different names, regions, or failure conditions.
- [ ] Complete at least two timed, unseen practice assessments with a personal target of 80 percent or higher.

The personal practice target is not the same as Microsoft's exam score and does not guarantee a pass. Use it as a signal that weak areas are becoming smaller and more stable.

- [Official free AZ-104 practice assessment](https://learn.microsoft.com/en-us/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21)

## Ready-to-Book Gate

- [ ] Explain every exam domain without relying on memorised command lists.
- [ ] Select an appropriate service from a scenario and justify the trade-offs.
- [ ] Interpret unfamiliar portal, PowerShell, Azure CLI, ARM, and Bicep examples.
- [ ] Troubleshoot from evidence rather than randomly changing settings.
- [ ] Recognise cost, scope, identity, network, and data-protection risks.

# Portfolio and Cloud Engineering Extensions

Start an extension after its listed dependencies are understood. Passing or
booking AZ-104 is not a prerequisite.

## Extension A: Enterprise Zero Trust Identity

### Depends On

Builds 12, 13, 20, and 22. Some features require Microsoft Entra ID P1 or P2 licensing.

### Build

- [ ] Configure MFA, named locations, Conditional Access, and authentication strengths.
- [ ] Configure PIM, access reviews, SSPR, dynamic groups, and Identity Protection where licensing permits.
- [ ] Model a joiner, mover, and leaver lifecycle.
- [ ] Automate reporting and selected administration with Microsoft Graph PowerShell.
- [ ] Use Terraform only for supported, well-understood identity resources.
- [ ] Use Python and Microsoft Graph for inactive-account, membership, or access reporting.
- [ ] Test report-only policies before enforcement and maintain an emergency-access design.

### Portfolio Evidence

- [ ] Zero Trust architecture and identity flow
- [ ] Policy catalogue and RBAC matrix
- [ ] Test results and rollback plan
- [ ] PowerShell and safe Terraform
- [ ] Security improvements and limitations

## Extension B: Enterprise Secrets Management

### Depends On

Builds 12, 14, 15, 17, 20, and 22.

### Build

- [ ] Deploy Azure Key Vault with Azure RBAC and restricted networking.
- [ ] Use managed identity instead of embedded credentials.
- [ ] Retrieve secrets safely from PowerShell, Azure CLI, and an application.
- [ ] Use Terraform or Bicep to deploy the public-safe infrastructure configuration.
- [ ] Use Python to test managed-identity access or generate a secret-metadata audit without exposing values.
- [ ] Design rotation, expiry, logging, recovery, and emergency-access processes.
- [ ] Scan the repository with a secret-detection tool.
- [ ] Test incorrect permissions, expired secrets, and disabled identities.

### Portfolio Evidence

- [ ] Secrets architecture and access model
- [ ] Rotation and recovery procedure
- [ ] Terraform or Bicep with no secret values committed
- [ ] Audit and troubleshooting evidence

## Extension C: Secure Terraform Pipeline

### Depends On

Builds 11-22 and Extension B.

### Build

- [ ] Rebuild selected capstone resources with reusable Terraform modules.
- [ ] Use remote state and workload identity federation rather than stored cloud secrets.
- [ ] Add formatting, validation, planning, policy scanning, and approval gates.
- [ ] Use Checkov or another suitable infrastructure-as-code scanner.
- [ ] Test public storage, open NSGs, missing tags, weak rules, and failed plans.
- [ ] Separate plan and apply permissions.
- [ ] Use Python to turn scan or plan output into a concise compliance summary when it adds value.

### Portfolio Evidence

- [ ] Architecture and pipeline diagram
- [ ] Terraform modules and environment inputs
- [ ] GitHub Actions workflow
- [ ] Security findings and remediation
- [ ] Controlled deployment and rollback evidence

## Extension D: Enterprise Golden Image Pipeline

### Depends On

Builds 16, 17, 20, and 22, plus Extension C.

### Build

- [ ] Create an Azure Compute Gallery, image definition, and version.
- [ ] Build a hardened image with Packer.
- [ ] Apply an appropriate security baseline and record justified exceptions.
- [ ] Validate the image before publishing it.
- [ ] Deploy a VM or scale set from the approved image version.
- [ ] Automate the secure image lifecycle with a pipeline.
- [ ] Use Terraform for gallery and deployment infrastructure where it improves repeatability.
- [ ] Use Python for image inventory, version lifecycle, or compliance reporting.
- [ ] Test failed builds, weak settings, publishing errors, and rollback to a previous version.

### Portfolio Evidence

- [ ] Image lifecycle and hardening documentation
- [ ] Packer, Bicep or Terraform, and pipeline files
- [ ] Validation and compliance evidence
- [ ] Versioning, rollback, cost, and deprecation process

## Extension E: Hybrid and Advanced Network Security

### Depends On

Builds 14, 19, 20, and 22.

### Build

- [ ] Expand the hub and spoke design.
- [ ] Configure Azure Firewall and policy.
- [ ] Configure VPN Gateway where cost and lab access permit.
- [ ] Compare Load Balancer, Application Gateway, and Azure Front Door at a high level.
- [ ] Add central logging and controlled route propagation.
- [ ] Rebuild suitable network and security controls with Terraform.
- [ ] Use Python for route, firewall, address-space, or connectivity reporting.

### Portfolio Evidence

- [ ] Hybrid network diagram and route tables
- [ ] Firewall policy and traffic tests
- [ ] Cost and licensing limitations
- [ ] Failure and recovery record

# Useful Patterns Adopted from Timothy Warner

[Timothy Warner's AZ-104 repository](https://github.com/timothywarner/az104) is used as a supplementary learning resource. The useful patterns adopted here are:

- Group labs by exam domain while preserving a progressive order.
- State prerequisites and practical outcomes clearly.
- Include verification, knowledge checks, troubleshooting, and cleanup.
- Maintain quick-reference and troubleshooting material alongside labs.
- Use practice questions and weak-area review after hands-on work.
- Offer different study timelines without treating time spent as proof of mastery.

His repository states that it aligns to the April 2025 exam update. This roadmap therefore uses the current Microsoft April 2026 study guide as the authority for exam scope and uses the repository for learning-structure ideas.

Treat third-party commands as material to understand and adapt, not as commands to
paste blindly. Replace example passwords and identifiers, use the least-privileged
role that can complete the task, verify current syntax in official documentation,
and never commit credentials from a guided lab.

# Cloud Engineering Progression Gate

Before claiming independent core Azure capability, demonstrate that you can:

- [ ] Build the core Azure environment from an empty lab scope.
- [ ] Use the portal, Azure CLI, Azure PowerShell, ARM, and Bicep at the level required by the current exam.
- [ ] Use Terraform to rebuild understood infrastructure and explain state, plan, apply, and drift.
- [ ] Use Python for at least one useful Azure SDK, inventory, validation, or reporting task.
- [ ] Apply identity, governance, storage, compute, networking, monitoring, and recovery controls.
- [ ] Troubleshoot realistic failures across all five exam domains.
- [ ] Explain security, cost, resilience, and operational trade-offs.
- [ ] Restore or rebuild resources without following exact steps.
- [ ] Use the AZ-104 confidence checkpoint when an exam decision becomes relevant.
- [ ] Publish evidence-safe documentation and clean up chargeable resources.
