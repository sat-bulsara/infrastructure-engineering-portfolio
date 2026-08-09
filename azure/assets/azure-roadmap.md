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
| F | Numbered portfolio projects | Projects 1-5 | Each project builds on demonstrated core knowledge |
| G | Microsoft Learn consolidation | Official paths and Applied Skills | Formal modules connect to project evidence and expose weak areas |
| H | AZ-104 assessment | Confidence checkpoint | You feel confident and the evidence-based readiness gate is complete |

## How Projects, Timothy Warner, and Microsoft Learn Work Together

For each topic, use the sources in this order:

1. **Companion introduction:** learn only the prerequisite needed for the next small project task.
2. **Your project:** build, verify, break, fix, explain, document, and clean up.
3. **Timothy Warner lab:** repeat or vary the topic for extra guided practice where a completed lab is available.
4. **Automation:** reproduce the understood service with PowerShell, Azure CLI, Bicep, Terraform, or Python when the tool adds value.
5. **Microsoft Learn consolidation:** complete the official learning paths after the projects, connect the terminology to real experience, and create targeted labs for any gaps.

Timothy Warner's repository is a useful supplement, especially for lab structure, quick reference, troubleshooting, and scenario practice. Some labs listed in its index are marked as coming soon, so the companion must check that a lab actually exists before assigning it.

Full Microsoft Learn paths are collected in the post-project consolidation stage.

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

## Repetition and Fluency System

Repeat small skills, not complete projects. A mini-lab should normally take 20 to
45 minutes and use a changed scenario so the learner must think rather than copy.
Repetition replaces part of normal review time instead of continually extending
the roadmap.

| Pass | Support | Task shape | Evidence |
| --- | --- | --- | --- |
| 1: Guided | Steps and explanations | Follow the workflow and explain each important choice | Working result, verification, and explanation |
| 2: Variation | Layered hints | Repeat the skill with a different resource, name, scope, or requirement | Verified result with fewer prompts |
| 3: Independent | Goal and constraints only | Select and perform the steps without a recipe | Independent result and decision notes |
| 4: Break/fix | Symptoms only | Diagnose and repair a controlled fault | Hypothesis, evidence, cause, fix, and retest |
| 5: Transfer | No procedural help | Apply the skill in a later project, another service, or an automation tool | Reusable code, project evidence, or teach-back |

Use approximate review spacing of the next session, one week, and one month for
important or weak skills. Adjust the interval from evidence: shorten it after a
struggle and lengthen it after an independent success.

### Repetition Rules

- Change at least one meaningful condition on every repeat. Do not use identical
  copy-and-paste instructions.
- Reduce help progressively from Full to Partial, Hint, and None.
- Interleave earlier skills into later builds. For example, a storage mini-lab
  can also retrieve RBAC scope, network access, tagging, and cleanup.
- Repeat weak or high-value skills, not everything equally.
- Stop drilling a skill when the learner can explain, perform, verify, and
  troubleshoot it with little or no help. Recheck it later through a project.
- If a full answer is shown, require a fresh variation or explanation before
  recording progress.

Example progressions include resource-group RBAC followed by storage-scope RBAC
and a wrong-scope fault; an NSG web rule followed by an application security
group variation and an effective-rule failure; and a Terraform resource followed
by a module variation and a drift investigation.

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

### Optional Guided Project Support

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

### Optional Guided Project Support

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

### Optional Guided Project Support

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

### Optional Guided Project Support

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

### Optional Guided Project Support

- [Timothy Warner: Storage accounts and Blob Storage](https://github.com/timothywarner/az104/blob/main/labs/storage/lab01-storage-accounts-blob.md)

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

## Build 16: Azure Virtual Machines and Resilience

### Outcome

Deploy, secure, resize, move, and recover Windows and Linux virtual machines.

### Optional Guided Project Support

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

### Optional Guided Project Support

- [Official Bicep documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
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

### Optional Guided Project Support

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

### Optional Guided Project Support

- [Timothy Warner: Virtual networks and NSGs](https://github.com/timothywarner/az104/blob/main/labs/networking/lab01-virtual-networks-nsg.md)
- [Timothy Warner: Troubleshooting scenarios](https://github.com/timothywarner/az104/tree/main/troubleshooting)

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

## Build 20: Azure Monitor and Operational Response

### Outcome

Collect, query, visualise, and act on Azure platform and workload telemetry.

### Optional Guided Project Support

- [Timothy Warner: Troubleshooting scenarios](https://github.com/timothywarner/az104/tree/main/troubleshooting)

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

## Build 21: Azure Backup and Disaster Recovery

### Outcome

Protect Azure workloads, restore lost data, and test regional recovery.

### Optional Guided Project Support

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

### Optional Guided Project Support

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

# Numbered Portfolio and Cloud Engineering Projects

Start a project after its listed dependencies are understood. Passing or
booking AZ-104 is not a prerequisite.

## Project 1: Enterprise Zero Trust Identity

### Place After

Builds 12, 13, 20, and 22. Some features require Microsoft Entra ID P1 or P2 licensing.

### Scenario

An organisation needs a secure identity design for employees, contractors, and
administrators. Access should be based on identity, risk, device context, and
least privilege rather than assumed trust.

### Learn

- [ ] Zero Trust principles and the shared-responsibility boundary
- [ ] MFA, authentication methods, and authentication strengths
- [ ] Conditional Access, named locations, report-only mode, and exclusions
- [ ] Privileged Identity Management and emergency-access accounts
- [ ] Access reviews, dynamic groups, and identity governance
- [ ] Joiner, mover, and leaver lifecycle
- [ ] Sign-in, audit, and Identity Protection data

### Build in the Portal

- [ ] Create representative employee, contractor, and administrator groups.
- [ ] Configure SSPR and appropriate authentication methods.
- [ ] Configure named locations.
- [ ] Create Conditional Access policies in report-only mode first.
- [ ] Configure an authentication strength.
- [ ] Configure PIM and access reviews where licensing permits.
- [ ] Configure dynamic groups and an identity-governance workflow.
- [ ] Model and test a joiner, mover, and leaver lifecycle.
- [ ] Maintain an emergency-access design before enforcing restrictive policies.

### PowerShell

- [ ] Use Microsoft Graph PowerShell to query and manage users and groups.
- [ ] Create public-safe bulk user and group workflows.
- [ ] Report Conditional Access, authentication, PIM, and group membership state.
- [ ] Audit inactive accounts without exposing personal data.

### Azure CLI

- [ ] Query Azure role assignments and managed identities.
- [ ] Use `az rest` only after the Graph request and permissions are understood.
- [ ] Verify scopes and avoid using Azure CLI as a replacement for unsupported Entra operations.

### Terraform

- [ ] Manage suitable Entra groups and Azure role assignments.
- [ ] Add supported Conditional Access resources only after manual policy testing.
- [ ] Protect state and avoid placing user secrets or tokens in variables.

### Python

- [ ] Use Microsoft Graph for inactive-account or membership reporting.
- [ ] Generate an RBAC or identity-governance report.
- [ ] Handle pagination, errors, and public-safe output.

### Verify

- [ ] MFA and authentication-strength enforcement
- [ ] Conditional Access results in report-only mode and controlled testing
- [ ] PIM activation and expiry
- [ ] Access-review completion
- [ ] Joiner, mover, and leaver access changes
- [ ] Emergency-access exclusions and monitoring

### Break and Troubleshoot

- [ ] Disabled or missing MFA method
- [ ] Incorrect RBAC scope
- [ ] Conditional Access policy conflict
- [ ] PIM activation failure
- [ ] Stale account or excessive group membership
- [ ] Locked-out test user with emergency access preserved

### Document

- [ ] Zero Trust architecture and identity flow
- [ ] Policy catalogue and exclusions
- [ ] RBAC matrix
- [ ] JML process
- [ ] Test, rollback, licensing, and production limitations

### GitHub

- [ ] Public-safe PowerShell, Terraform, and Python
- [ ] Sanitised diagrams and screenshots
- [ ] No tenant IDs, object IDs, UPNs, tokens, or credentials

### Review

- [ ] Explain how the design reduces standing privilege.
- [ ] Explain what could cause tenant lockout and how it is prevented.
- [ ] Identify what was guided and what was completed independently.

## Project 2: Enterprise Secrets Management

### Place After

Builds 12, 14, 15, 17, 20, and 22, followed by Project 1 identity knowledge.

### Scenario

Applications and automation need credentials without storing plaintext secrets in
source code, deployment files, pipelines, or administrator workstations.

### Learn

- [ ] Azure Key Vault security model
- [ ] Azure RBAC compared with legacy access policies
- [ ] Managed identities and workload identity
- [ ] Secrets, keys, certificates, expiry, and rotation
- [ ] Soft delete, purge protection, backup, and recovery
- [ ] Private endpoints, firewalls, DNS, and trusted service access
- [ ] Audit logging and secret scanning

### Build in the Portal

- [ ] Create a Key Vault with Azure RBAC.
- [ ] Enable appropriate recovery protection.
- [ ] Restrict network access and configure private connectivity where suitable.
- [ ] Create a managed identity for a test workload.
- [ ] Store a short-lived test secret without exposing its value in evidence.
- [ ] Grant the identity the minimum required data-plane role.
- [ ] Configure diagnostic settings and expiry notifications.

### PowerShell

- [ ] Query Key Vault configuration and role assignments.
- [ ] Retrieve a secret into memory without printing or logging the value.
- [ ] Report secret names, expiry, enabled state, and rotation metadata only.
- [ ] Test an unauthorised identity and record the safe error evidence.

### Azure CLI

- [ ] Query vault, identity, networking, and RBAC configuration.
- [ ] Retrieve a test secret without storing it in shell history or output files.
- [ ] Validate managed-identity access from the authorised workload.

### Bicep and Terraform

- [ ] Deploy the vault, private endpoint, diagnostic settings, identity, and role assignments.
- [ ] Keep secret values outside code and Terraform state where possible.
- [ ] Compare Bicep deployment state with Terraform-managed state.

### Python

- [ ] Use `DefaultAzureCredential` and managed identity for secret access.
- [ ] Build a metadata-only expiry or rotation audit.
- [ ] Handle forbidden, disabled, deleted, and expired-secret conditions safely.

### Verify

- [ ] Authorised managed identity can retrieve the test secret.
- [ ] Unauthorised identities are denied.
- [ ] Private DNS and endpoint routing work as intended.
- [ ] Logs record access without exposing secret values.
- [ ] Recovery protection and expiry metadata are configured.

### Break and Troubleshoot

- [ ] Incorrect role or scope
- [ ] Disabled managed identity
- [ ] Expired or disabled secret
- [ ] Private endpoint or DNS failure
- [ ] Firewall denial
- [ ] Pipeline authentication failure

### Document

- [ ] Secrets architecture and data flow
- [ ] Access and trust model
- [ ] Rotation, expiry, recovery, and emergency-access procedure
- [ ] Network and logging controls
- [ ] Limitations and production improvements

### GitHub

- [ ] Bicep or Terraform infrastructure
- [ ] Public-safe PowerShell and Python examples
- [ ] Secret-scanning configuration and results
- [ ] No secret values, tokens, client secrets, or sensitive state files

### Review

- [ ] Explain why managed identity is preferable to an embedded secret.
- [ ] Explain the control-plane and data-plane permissions involved.
- [ ] Demonstrate recovery from one safe failure condition.

## Project 3: Secure Terraform Pipeline

### Place After

Builds 11-22 and Project 2.

### Scenario

An infrastructure team needs repeatable Azure deployments with reviewable plans,
security checks, controlled permissions, and no long-lived cloud credentials.

### Learn

- [ ] Terraform providers, resources, data sources, variables, outputs, and modules
- [ ] State, remote backends, locking, drift, imports, and lifecycle behaviour
- [ ] Plan compared with apply
- [ ] Workload identity federation and least-privilege pipeline identities
- [ ] CI/CD stages, approvals, protected environments, and branch controls
- [ ] Infrastructure-as-code scanning and policy as code
- [ ] Rollback, recovery, and state protection

### Build Locally

- [ ] Rebuild selected capstone resources with reusable Terraform modules.
- [ ] Separate environment configuration from reusable modules.
- [ ] Configure a secure remote state backend.
- [ ] Import one suitable existing resource and review the generated state relationship.
- [ ] Detect and resolve a controlled drift example.

### GitHub Actions

- [ ] Configure workload identity federation instead of a stored client secret.
- [ ] Run formatting, initialisation, validation, planning, and security scanning.
- [ ] Store the plan as controlled workflow evidence.
- [ ] Require an approval boundary before apply.
- [ ] Separate plan and apply permissions.
- [ ] Protect production-like environments from unreviewed branches.

### PowerShell and Azure CLI

- [ ] Bootstrap or verify the identity, federated credential, role assignment, and state backend.
- [ ] Confirm the active subscription and pipeline scope.
- [ ] Query deployment and activity logs when a pipeline fails.

### Terraform

- [ ] Deploy a VNet, NSGs, storage, compute or App Service, monitoring, and Key Vault integration.
- [ ] Use modules, validation rules, consistent tags, and useful outputs.
- [ ] Keep secrets out of code, variables, plans, workflow logs, and state where possible.
- [ ] Pin suitable provider and action versions.

### Python

- [ ] Parse Terraform plan or Checkov output.
- [ ] Generate a concise compliance or change summary.
- [ ] Fail safely when expected results are absent or malformed.

### Verify

- [ ] Pull requests produce a readable plan and security result.
- [ ] Apply requires the intended approval and identity.
- [ ] The deployment matches the reviewed plan.
- [ ] Remote state is protected and inaccessible to unauthorised users.
- [ ] A second plan shows no unexpected changes.

### Break and Troubleshoot

- [ ] Public storage configuration
- [ ] Open NSG rule
- [ ] Missing tags
- [ ] Failed provider authentication
- [ ] State lock or backend access failure
- [ ] Drift or failed apply
- [ ] Security scanner finding

### Document

- [ ] Architecture and pipeline diagram
- [ ] Identity and permission model
- [ ] Module and environment structure
- [ ] Plan, approval, apply, rollback, and state-recovery process
- [ ] Security findings and remediation

### GitHub

- [ ] Terraform modules and environment examples
- [ ] GitHub Actions workflow
- [ ] Checkov or equivalent configuration
- [ ] Public-safe Python report tool
- [ ] No state files, plans containing secrets, credentials, or live identifiers

### Review

- [ ] Explain Terraform state, drift, plan, apply, and import.
- [ ] Explain why workload identity federation reduces credential risk.
- [ ] Demonstrate diagnosis of one failed pipeline stage.

## Project 4: Enterprise Golden Image Pipeline

### Place After

Builds 16, 17, 20, and 22, plus Project 3.

### Scenario

An organisation needs consistent, hardened, versioned virtual-machine images that
can be tested, approved, deployed, replaced, and retired safely.

### Learn

- [ ] Image hardening and security baselines
- [ ] Generalised images and workload-specific image decisions
- [ ] Azure Compute Gallery, definitions, versions, replicas, and regions
- [ ] Packer templates and provisioners
- [ ] Image validation, vulnerability management, and patch lifecycle
- [ ] Version promotion, rollback, deprecation, and deletion
- [ ] Pipeline identity, artefact integrity, and change control

### Build in the Portal

- [ ] Create an Azure Compute Gallery.
- [ ] Create an image definition with appropriate generation and security type.
- [ ] Publish an initial image version.
- [ ] Deploy a test VM from the version.
- [ ] Record regional replication, storage, and ongoing cost choices.

### Packer

- [ ] Create a parameterised image template.
- [ ] Apply an appropriate Windows or Linux security baseline.
- [ ] Install required updates and approved software.
- [ ] Remove build artefacts and generalise the image.
- [ ] Publish a version only after validation succeeds.

### PowerShell and Azure CLI

- [ ] Query gallery, definition, version, replication, and VM-image state.
- [ ] Start and inspect image builds.
- [ ] Deploy and test a VM or scale set from an approved version.
- [ ] Deprecate a failed or superseded image safely.

### Bicep and Terraform

- [ ] Deploy gallery and image-definition infrastructure.
- [ ] Deploy test VMs or scale sets from a selected version.
- [ ] Keep the image build process separate from long-lived environment state.

### Python

- [ ] Inventory image definitions and versions.
- [ ] Report age, replication regions, deprecation state, and dependent deployments.
- [ ] Produce a public-safe compliance or lifecycle report.

### Verify

- [ ] Image build and validation complete successfully.
- [ ] Baseline controls and required auditing are enabled.
- [ ] A test deployment boots and passes health checks.
- [ ] Version metadata and regional replicas are correct.
- [ ] A previous approved version remains available for rollback.

### Break and Troubleshoot

- [ ] Failed Packer build
- [ ] Missing update or weakened setting
- [ ] Generalisation failure
- [ ] Gallery publishing or replication failure
- [ ] VM deployment failure
- [ ] Faulty version requiring rollback

### Document

- [ ] Image architecture and lifecycle
- [ ] Hardening process and justified exceptions
- [ ] Build, test, approval, promotion, rollback, and retirement process
- [ ] Versioning, cost, licensing, and regional limitations

### GitHub

- [ ] Packer template
- [ ] Bicep or Terraform
- [ ] Pipeline workflow
- [ ] Python image inventory
- [ ] Sanitised validation and compliance evidence

### Review

- [ ] Explain why an image must be patched and rebuilt over time.
- [ ] Explain the difference between a gallery, definition, and version.
- [ ] Demonstrate rollback from one failed image version.

## Project 5: Hybrid and Advanced Network Security

### Place After

Builds 14, 19, 20, and 22. This is a nice-to-have project and may incur
significant gateway or firewall costs.

### Scenario

An organisation needs a controlled hub and spoke network with central inspection,
hybrid connectivity, private name resolution, and evidence-based troubleshooting.

### Learn

- [ ] Hub and spoke design, route propagation, and transit
- [ ] Azure Firewall, firewall policy, rule collections, and threat intelligence
- [ ] VPN Gateway, local network gateways, connections, and shared-key handling
- [ ] Private DNS and hybrid name resolution
- [ ] NAT Gateway and controlled outbound access
- [ ] Load Balancer, Application Gateway, and Azure Front Door use cases
- [ ] Network Watcher, flow logs, monitoring, and cost management

### Build in the Portal

- [ ] Expand the hub and spoke topology.
- [ ] Create dedicated gateway and firewall subnets with valid sizing.
- [ ] Configure Azure Firewall and a firewall policy.
- [ ] Configure user-defined routes for controlled inspection.
- [ ] Configure VPN Gateway only where cost and lab access permit.
- [ ] Configure private DNS and documented hybrid resolution.
- [ ] Add central diagnostic settings and network monitoring.

### PowerShell and Azure CLI

- [ ] Query peerings, effective routes, effective NSG rules, firewall policy, and gateways.
- [ ] Test source-to-destination connectivity and next hop.
- [ ] Review activity, firewall, and connection logs.
- [ ] Stop and clean up expensive resources promptly when the lab ends.

### Terraform

- [ ] Build reusable hub, spoke, route, security, firewall, and diagnostic modules.
- [ ] Keep VPN shared keys outside code and state where possible.
- [ ] Use validation for address spaces and required subnets.
- [ ] Produce a reviewed plan before any high-cost deployment.

### Python

- [ ] Detect overlapping address spaces with `ipaddress`.
- [ ] Generate route, peer, firewall, DNS, or connectivity inventory.
- [ ] Summarise Network Watcher or firewall results without exposing public IPs.

### Verify

- [ ] Intended spokes communicate through the approved path.
- [ ] Disallowed traffic is blocked and logged.
- [ ] Effective routes and next hop match the design.
- [ ] DNS resolves across the intended network boundaries.
- [ ] Hybrid tunnel and routes are healthy where implemented.

### Break and Troubleshoot

- [ ] Route bypassing the firewall
- [ ] Asymmetric routing
- [ ] Blocked firewall rule
- [ ] Broken peering or gateway transit
- [ ] VPN negotiation or shared-key mismatch
- [ ] Private DNS link or record failure
- [ ] Unexpected cost from retained gateway resources

### Document

- [ ] Hybrid network and packet-path diagrams
- [ ] Address, subnet, route, and firewall-policy tables
- [ ] DNS and hybrid connectivity design
- [ ] Cost model and cleanup procedure
- [ ] Failure and recovery records

### GitHub

- [ ] Terraform modules and safe examples
- [ ] PowerShell, Azure CLI, and Python reports
- [ ] Sanitised diagrams and test evidence
- [ ] No public IPs, shared keys, IDs, tokens, or live configuration exports

### Review

- [ ] Explain the expected path for a packet between two spokes.
- [ ] Explain when Azure Firewall, NSG, Application Gateway, and Front Door differ.
- [ ] Diagnose one broken route or rule from evidence.

# Post-Project Microsoft Learn Consolidation

Complete the full Microsoft Learn paths after the projects. At this point the
services and terminology should connect to real configurations, failures, and
automation you have already seen.

## Official Learning Paths

Complete them in this order:

1. [AZ-104 prerequisites for Azure administrators](https://learn.microsoft.com/en-us/training/paths/az-104-administrator-prerequisites/)
2. [Manage identities and governance in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-identities-governance/)
3. [Implement and manage storage in Azure](https://learn.microsoft.com/en-us/training/paths/az-104-manage-storage/)
4. [Deploy and manage Azure compute resources](https://learn.microsoft.com/en-us/training/paths/az-104-manage-compute-resources/)
5. [Configure and manage virtual networks](https://learn.microsoft.com/en-us/training/paths/az-104-manage-virtual-networks/)
6. [Monitor and back up Azure resources](https://learn.microsoft.com/en-us/training/paths/az-104-monitor-backup-resources/)

For each learning path:

- [ ] Attempt a short retrieval quiz before opening the modules.
- [ ] Link each major concept to existing project evidence.
- [ ] Record terminology or behaviour that was new or unclear.
- [ ] Complete the module knowledge checks.
- [ ] Create one small follow-up drill for each weak area.
- [ ] Update the companion progress record with demonstrated learning.

## Microsoft Applied Skills

Complete these after the related Microsoft Learn path:

1. [Configure secure access to your workloads using Azure networking](https://learn.microsoft.com/en-us/credentials/applied-skills/configure-secure-workloads-use-azure-virtual-networking/)
2. [Secure storage for Azure Files and Azure Blob Storage](https://learn.microsoft.com/en-us/credentials/applied-skills/secure-storage-azure-files-azure-blob-storage/)
3. [Deploy and configure Azure Monitor](https://learn.microsoft.com/en-us/credentials/applied-skills/deploy-and-configure-azure-monitor/)

- [ ] Complete each official learning path.
- [ ] Attempt each lab assessment when confident.
- [ ] Record weak areas without treating a pass as proof of complete mastery.
- [ ] Repeat or extend the related personal project where the assessment exposes a gap.

# Optional AZ-104 Confidence Checkpoint

Use this checkpoint only when you decide that sitting the exam would be useful.
It does not block continued Azure or portfolio learning.

## Official Study

- [ ] Map every current skills-measured item to project evidence or a reviewed knowledge note.
- [ ] Review the [current AZ-104 study guide](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/az-104) again shortly before the exam.
- [ ] Use the Microsoft exam sandbox to learn the question interface.

## Retrieval and Practice

- [ ] Complete mixed scenario questions without notes.
- [ ] Review every incorrect answer and state why each alternative was wrong.
- [ ] Repeat weak projects using different names, regions, or failure conditions.
- [ ] Complete at least two timed, unseen practice assessments with a personal target of 80 percent or higher.

The personal practice target is not the same as Microsoft's exam score and does
not guarantee a pass. Use it as a signal that weak areas are becoming smaller
and more stable.

- [Official free AZ-104 practice assessment](https://learn.microsoft.com/en-us/credentials/certifications/exams/az-104/practice/assessment?assessment-type=practice&assessmentId=21)

## Ready-to-Book Gate

- [ ] Explain every exam domain without relying on memorised command lists.
- [ ] Select an appropriate service from a scenario and justify the trade-offs.
- [ ] Interpret unfamiliar portal, PowerShell, Azure CLI, ARM, and Bicep examples.
- [ ] Troubleshoot from evidence rather than randomly changing settings.
- [ ] Recognise cost, scope, identity, network, and data-protection risks.
- [ ] Feel confident that the exam is confirming existing knowledge rather than introducing it.

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
