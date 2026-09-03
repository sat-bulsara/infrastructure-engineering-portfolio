# Phase 3: Azure Administration and Cloud Engineering Roadmap

> Goal: Build, secure, operate and troubleshoot Azure environments while becoming fluent with the portal, Azure CLI, Bash/Zsh, PowerShell, Linux, Terraform and Bicep.

This is one chronological project sequence. There are no separate extension projects. Each project builds on earlier work and deliberately repeats important administration tasks with fewer hints.

Every numbered project uses a mandatory security gate: identify the identities
and data involved, draw the trust and network boundaries, minimise public
exposure and permissions, protect secrets, define useful detection and
recovery evidence, assess blast radius and verify safe cleanup. A project is
not complete merely because its resources deployed successfully.

Projects 11 to 32 cover the core Azure administration journey and repeatedly apply the practical skills associated with AZ-104. Projects 33 to 42 extend that foundation into enterprise identity, secure infrastructure delivery, software-supply-chain security, platform engineering, Kubernetes, AI security and larger capstones. Public documentation should describe the engineering work, not present projects as exam exercises.

## Project sequence

| Project | Title | Main focus | Estimated time | Expected support |
| --- | --- | --- | --- | --- |
| 11 | Azure Foundations and Safe Lab Operations | Context, cost controls, tags and locks | 6-8 hours | Guided |
| 12 | Microsoft Entra Identity and Azure Access | Users, groups, RBAC and JML | 10-14 hours | Guided |
| 13 | Azure Governance and Landing-Zone Controls | Management groups, Policy and governance | 10-14 hours | Guided to variation |
| 14 | Virtual Networks, Subnets and NSGs | Core networking and traffic control | 10-14 hours | Guided to variation |
| 15 | VNet Peering, Private DNS and Private Endpoints | Private connectivity and name resolution | 10-14 hours | Variation |
| 16 | Secure Azure Storage and Data Protection | Storage security, access and lifecycle | 14-18 hours | Variation |
| 17 | Linux VM Administration and Secure Access | Linux, SSH, Bash and VM operations | 12-16 hours | Variation |
| 18 | Windows VMs, Availability and Governance | Windows compute, resilience and policy | 14-18 hours | Variation |
| 19 | ARM Templates and Bicep | Native Azure infrastructure as code | 8-12 hours | Partial hints |
| 20 | Terraform Foundations, State and Drift | Declarative deployment and state | 12-16 hours | Partial hints |
| 21 | App Service Deployment and Production Operations | PaaS deployment, identity and diagnostics | 10-14 hours | Partial hints |
| 22 | Azure Containers and Managed Workloads | Container deployment and operations | 10-14 hours | Partial hints |
| 23 | Load Balancing and Network Troubleshooting | Load Balancer, Network Watcher and diagnosis | 10-14 hours | Partial hints |
| 24 | Application Gateway, WAF and Front Door | Layer 7 delivery and edge security | 12-16 hours | Partial hints |
| 25 | Hub-and-Spoke Networking, Routing and Azure Firewall | Enterprise topology and inspection | 16-22 hours | Mostly independent |
| 26 | Hybrid Connectivity, VPN and DNS | Site-to-site design and hybrid resolution | 14-20 hours | Mostly independent |
| 27 | Azure Monitor, KQL and Operational Response | Monitoring, alerting and investigation | 14-18 hours | Mostly independent |
| 28 | Defender for Cloud and Security Posture | Recommendations, secure score and remediation | 10-14 hours | Mostly independent |
| 29 | Microsoft Sentinel and Security Investigation | SIEM, analytics, incidents and hunting | 12-18 hours | Mostly independent |
| 30 | Backup, Restore and Disaster Recovery | Recovery controls and tested restoration | 16-22 hours | Mostly independent |
| 31 | Azure Administrator Scenario Challenge | Full AZ-104 skills integration | 18-24 hours | Independent with review |
| 32 | Capstone 1: Governed Azure Administrator Environment | Integrated core administration | 24-35 hours | Independent with review |
| 33 | Zero Trust Identity and JML | Advanced identity lifecycle and access | 14-20 hours | Independent |
| 34 | Key Vault, Managed Identity and Secrets | Workload identity and secrets | 10-14 hours | Independent |
| 35 | Enterprise Terraform Structure and State | Modules, environments, remote state and recovery | 12-18 hours | Independent |
| 36 | Secure Terraform Delivery with GitHub Actions | OIDC, pull-request plans, approvals and pipeline operations | 14-20 hours | Independent |
| 37 | GitHub Advanced Security and Software Supply Chain | Secret, code, dependency and IaC security gates | 12-18 hours | Independent |
| 38 | AKS Platform Operations, GitOps and Container Security | Kubernetes operations and secure delivery | 20-30 hours | Independent |
| 39 | Golden Image and Compute Gallery Pipeline | Repeatable secure compute images | 16-24 hours | Independent |
| 40 | Capstone 2: Secure Cloud Platform | Secure application platform delivery | 30-45 hours | Independent |
| 41 | Capstone 3: Hybrid Operations and Incident Recovery | Hybrid faults, operations and recovery | 30-45 hours | Independent |
| 42 | Optional Secure Azure AI Platform | AI workload identity, exposure, monitoring and threat controls | 12-18 hours | Independent |

Time estimates include prerequisite study, the practical build, command-line repetition, verification, one break/fix exercise, evidence capture and the first documentation pass. They are planning ranges, not deadlines. Repetition or troubleshooting can make a worthwhile project longer.

## Six-month mini-lab track

Mini-labs sit between and inside the numbered projects. They are short operational
repetitions, not extra portfolio projects. Most take 20-45 minutes and use a
changed scenario with less help than the original build. Only the next due
mini-lab is created under `azure/learning/az-104/practice/`, which keeps the
course fluid and allows weak areas to replace already-secure topics.

The normal rhythm is:

1. Complete the relevant guided section of a numbered project.
2. Perform the immediate variation during the same or next session.
3. Attempt the independent or break/fix lab about one week later.
4. Retrieve the skill again about one month later or transfer it into a later project.

Progression labels are `R1 Guided`, `R2 Variation`, `R3 Independent`,
`R4 Break/fix` and `R5 Transfer`. A successful R1 does not prove fluency.

### Foundations, identity and governance

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML11-01 | Project 11 context check | R2 | Detect and correct a deliberately wrong subscription context | Portal, CLI, PowerShell | 20 min |
| ML11-02 | Project 11 tags and locks | R3 | Build a tagged disposable resource group and prove a delete lock works | CLI | 25 min |
| ML11-03 | One week after Project 11 | R4 | Diagnose why a cleanup command is blocked | Activity log, CLI | 20 min |
| ML11-04 | Project 13 | R5 | Reapply naming, expiry and cost controls to a governance workload | PowerShell | 30 min |
| ML12-01 | Project 12 group RBAC | R2 | Give a changed group Reader access at storage-account scope | Portal, CLI | 30 min |
| ML12-02 | Project 12 verification | R3 | Prove control-plane viewing and denied modification with a test identity | Portal | 30 min |
| ML12-03 | One week after Project 12 | R4 | Find a direct assignment that bypasses the group model | CLI, PowerShell | 30 min |
| ML12-04 | Project 16 | R5 | Select and assign the narrowest Blob data-plane role | PowerShell | 25 min |
| ML13-01 | Project 13 Policy | R2 | Change an allowed-location assignment from Audit to Deny at safe scope | CLI | 30 min |
| ML13-02 | Project 13 tagging | R3 | Enforce a different required tag and test compliant and denied resources | Portal, CLI | 35 min |
| ML13-03 | One week after Project 13 | R4 | Diagnose inheritance, duplicate assignments and unexpected compliance | Policy Insights | 35 min |
| ML13-04 | Project 19 | R5 | Express a small governance baseline in Bicep | Bicep | 40 min |

### Networking and private connectivity

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML14-01 | Project 14 addressing | R2 | Subnet a changed `/16` into three non-overlapping `/24` networks | Paper, CLI help | 20 min |
| ML14-02 | Project 14 NSGs | R3 | Build rules from a web-to-app traffic matrix | CLI | 35 min |
| ML14-03 | Project 14 verification | R4 | Repair an NSG priority conflict that blocks HTTPS | Portal, CLI | 30 min |
| ML14-04 | One month after Project 14 | R4 | Diagnose a correct rule attached to the wrong subnet | Effective rules, PowerShell | 30 min |
| ML14-05 | Project 23 | R5 | Reuse subnet and NSG reasoning in an end-to-end connectivity ticket | Network Watcher | 40 min |
| ML15-01 | Before Project 16 | R2 | Compare a storage service endpoint with a private endpoint | Portal, CLI | 35 min |
| ML15-02 | One week after Project 15 | R3 | Create bidirectional peering from requirements without a recipe | Terraform | 40 min |
| ML15-03 | One week after Project 15 | R4 | Diagnose one-sided peering | CLI, PowerShell | 25 min |
| ML15-04 | Project 16 private access | R4 | Repair public DNS resolution caused by a missing VNet link | Private DNS, CLI | 30 min |
| ML15-05 | Project 25 | R5 | Transfer private DNS and peering into a hub-and-spoke design | Terraform | 45 min |

### Storage and data protection

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML16-01 | Project 16 redundancy | R2 | Choose LRS, ZRS, GRS or RA-GRS for four changed business cases | Scenario drill | 20 min |
| ML16-02 | Project 16 authorisation | R2 | Compare Reader, Blob Data Reader and Blob Data Contributor | Portal, PowerShell | 25 min |
| ML16-03 | Project 16 SAS | R3 | Create a short-lived least-privilege SAS and revoke it safely | CLI | 35 min |
| ML16-04 | Project 16 protection | R3 | Overwrite and delete test blobs, then restore the correct version | CLI, PowerShell | 40 min |
| ML16-05 | Project 16 lifecycle | R3 | Implement and verify a changed Hot-to-Cool lifecycle rule | Portal, CLI | 30 min |
| ML16-06 | One week after Project 16 | R4 | Diagnose control-plane access without Blob data-plane access | Activity log, RBAC | 30 min |
| ML16-07 | One month after Project 16 | R4 | Repair anonymous/public-network settings without breaking authorised access | CLI | 30 min |
| ML16-08 | Project 30 | R5 | Restore storage data during a recovery ticket | PowerShell | 40 min |

### Compute and operating systems

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML17-01 | Project 17 deployment | R2 | Inspect a Linux VM, disks, NIC and boot diagnostics | CLI, Bash | 30 min |
| ML17-02 | Project 17 service work | R3 | Deploy and verify a small Linux service without a procedural recipe | SSH, systemd | 40 min |
| ML17-03 | Project 17 security | R4 | Diagnose SSH failure using NSGs, routes, service state and logs | Bash, Network Watcher | 40 min |
| ML17-04 | One month after Project 17 | R4 | Repair a failed Linux service and explain the evidence chain | journalctl, systemctl | 30 min |
| ML18-01 | Project 18 availability | R2 | Select zones, availability sets or scale sets for changed requirements | Scenario, Portal | 25 min |
| ML18-02 | Project 18 disks | R3 | Add, initialise and verify a managed data disk | PowerShell | 40 min |
| ML18-03 | Project 18 extensions | R4 | Diagnose a failed VM extension without recreating the VM | Portal, PowerShell | 35 min |
| ML18-04 | Project 30 | R5 | Restore a changed Windows workload from backup | PowerShell | 45 min |
| ML18-05 | Project 18 lifecycle | R3 | Assess updates, run a controlled maintenance window and prove post-patch health | Update Manager, PowerShell | 45 min |

### Infrastructure as code and deployment

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML19-01 | Project 19 templates | R2 | Read an ARM deployment and predict the resource changes | ARM JSON | 25 min |
| ML19-02 | Project 19 Bicep | R3 | Convert a small understood portal resource into Bicep | Bicep | 40 min |
| ML19-03 | One week after Project 19 | R4 | Diagnose a parameter, dependency or scope deployment failure | Bicep, activity log | 35 min |
| ML20-01 | Project 20 plans | R2 | Explain add, change, replace and destroy actions before approval | Terraform | 25 min |
| ML20-02 | Project 20 state | R3 | Import a pre-existing resource and reach a no-change plan | Terraform, CLI | 40 min |
| ML20-03 | Project 20 drift | R4 | Detect, explain and repair a controlled portal drift | Terraform | 40 min |
| ML20-04 | Project 25 | R5 | Refactor repeated networking resources into a reusable module | Terraform | 45 min |
| ML20-05 | Project 35 | R5 | Move state to a protected remote backend and use a review branch | Terraform, Git | 45 min |
| ML35-01 | Project 35 state | R3 | Recover a locked or interrupted remote-state workflow without bypassing safety controls | Terraform, Azure Storage | 40 min |
| ML36-01 | Project 36 pull request | R3 | Diagnose an OIDC or Azure-scope failure from GitHub Actions logs | GitHub Actions, Azure RBAC | 40 min |
| ML36-02 | One week after Project 36 | R4 | Review a destructive Terraform plan and prevent an unsafe apply | GitHub, Terraform | 40 min |
| ML37-00 | Start of Project 37 | R1 | Build a Gitleaks pull-request check, trigger it with a documented fake pattern, remediate it and prove the clean rerun | GitHub Actions, Git | 45 min |
| ML37-01 | Project 37 security gate | R3 | Triage one secret, code, dependency or IaC finding and prove remediation | GitHub security tools | 40 min |
| ML37-02 | One week after Project 37 | R4 | Repair a pull request blocked by a seeded supply-chain finding | GitHub Actions, security evidence | 45 min |

### Applications, containers and advanced networking

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML21-01 | Project 21 slots | R2 | Deploy a changed app version to staging and swap safely | CLI | 35 min |
| ML21-02 | Project 21 identity | R3 | Grant a managed identity minimum access to one dependency | PowerShell | 35 min |
| ML21-03 | One week after Project 21 | R4 | Diagnose an unhealthy App Service after a configuration change | Logs, metrics | 35 min |
| ML22-01 | Project 22 containers | R2 | Run a changed container with restricted exposure | CLI | 30 min |
| ML22-02 | Project 22 registry | R3 | Push, pull and verify an image using managed authentication | ACR, CLI | 35 min |
| ML22-03 | One week after Project 22 | R4 | Diagnose image pull failure from identity, network and tag evidence | CLI, logs | 35 min |
| ML23-01 | Project 23 load balancing | R2 | Predict and verify a health-probe failure | Load Balancer, CLI | 30 min |
| ML23-02 | Project 23 troubleshooting | R3 | Trace a packet path through DNS, NSG, route and backend health | Network Watcher | 40 min |
| ML23-03 | One week after Project 23 | R4 | Resolve an intermittent connectivity ticket from evidence only | CLI, PowerShell | 40 min |
| ML24-01 | Project 24 WAF | R2 | Compare prevention and detection behaviour with safe test traffic | WAF logs | 35 min |
| ML24-02 | Project 24 routing | R3 | Route two hostnames or paths to different backends | Application Gateway | 40 min |
| ML24-03 | Project 29 | R5 | Investigate a blocked request using WAF and Sentinel evidence | KQL | 40 min |
| ML25-01 | Project 25 routing | R3 | Build and explain a changed user-defined route table | CLI | 35 min |
| ML25-02 | Project 25 Firewall | R4 | Diagnose a flow blocked by routing or Azure Firewall policy | Network Watcher, logs | 45 min |
| ML25-03 | Project 25 Firewall | R3 | Implement one least-privilege Azure Firewall rule from an approved traffic request and verify the flow | Firewall Policy, CLI | 40 min |
| ML26-01 | Project 26 hybrid DNS | R3 | Design split resolution for an on-premises-style namespace | DNS tools | 35 min |
| ML26-02 | Project 26 VPN | R4 | Diagnose a simulated tunnel or route failure from connection evidence | CLI, PowerShell | 45 min |

### Monitoring, security and recovery

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML27-01 | Project 27 metrics | R2 | Create and test a changed metric alert | Portal, CLI | 30 min |
| ML27-02 | Project 27 logs | R3 | Write KQL to find a failed operation and summarise it | Log Analytics | 35 min |
| ML27-03 | One week after Project 27 | R4 | Diagnose why expected logs are missing | Diagnostic settings, KQL | 35 min |
| ML28-01 | Project 28 posture | R2 | Triage recommendations by risk, cost and evidence | Defender for Cloud | 30 min |
| ML28-02 | Project 28 remediation | R3 | Remediate one safe finding and prove the changed posture | CLI, Portal | 35 min |
| ML28-03 | One week after Project 28 | R4 | Process a vulnerability ticket from affected asset through controlled remediation, retest and residual risk | Defender for Cloud, PowerShell | 40 min |
| ML29-01 | Project 29 incidents | R3 | Investigate a changed alert and build a short incident timeline | Sentinel, KQL | 40 min |
| ML29-02 | One week after Project 29 | R4 | Distinguish a false positive from a confirmed incident using evidence | Sentinel | 40 min |
| ML30-01 | Project 30 backup | R2 | Verify protection state and perform an item-level restore | PowerShell | 40 min |
| ML30-02 | Project 30 recovery | R3 | Execute a changed restore from stated RPO and RTO requirements | Portal, CLI | 45 min |
| ML30-03 | One week after Project 30 | R4 | Diagnose a failed or incomplete backup job | Logs, PowerShell | 40 min |

### Integration and readiness

| ID | Due after | Level | Mini-lab | Main tools | Target time |
| --- | --- | --- | --- | --- | --- |
| ML31-01 | Before Project 31 | R3 | Complete a mixed identity, storage and networking ticket | Portal, CLI | 45 min |
| ML31-02 | During Project 31 | R4 | Diagnose a multi-layer failure with one misleading symptom | CLI, PowerShell, logs | 45 min |
| ML31-03 | After Project 31 assessment | R3/R4 | Repair the weakest measured AZ-104 objective | Best-fit tools | 30-45 min |
| ML31-04 | One month later | R5 | Repeat a mixed administrator ticket with no procedural hints | Best-fit tools | 45 min |
| ML31-05 | During Project 31 | R3 | Own a 2nd/3rd-line Azure ticket from impact and stakeholder update through change, rollback decision, verification and closure | PowerShell, ITIL-lite record | 45 min |

This bank is deliberately larger than the minimum path. The tutor selects the
next due lab from evidence in `PROGRESS.md`; it does not force every lab when the
skill has already reached independent, delayed recall. Conversely, a weak skill
can receive an additional changed repetition without renumbering the portfolio
projects.

## AZ-104 reinforcement map

The exam domains are deliberately repeated rather than taught once:

| Current AZ-104 domain | First focused projects | Later reinforcement |
| --- | --- | --- |
| Manage Azure identities and governance | 11-13 | 28, 31-34, 36, 38, 40-42 |
| Implement and manage storage | 16 | 21, 28, 30-32, 34-36, 40 |
| Deploy and manage compute resources | 17-18, 21-22 | 27-32, 38-41 |
| Implement and manage virtual networking | 14-15, 23-26 | 29, 31-32, 38, 40-41 |
| Monitor and maintain Azure resources | 27, 30 | 28-32, 38, 40-42 |

Project 31 is a deliberate exam-scope integration project. It uses business scenarios and practical changes rather than copied exam questions. The official practice assessment comes later to reveal remaining gaps.

### Detailed coverage checkpoints

These smaller objectives must be demonstrated inside the larger projects. They do not need separate portfolio projects, but they must not be skipped:

- Entra licences, external users and self-service password reset
- Azure Advisor cost and reliability recommendations
- Storage firewalls, SAS, stored access policies, access keys and identity-based Azure Files access
- Storage encryption, object replication, Storage Explorer, AzCopy and Azure File Sync
- Application security groups, service endpoints, Azure Bastion and effective NSG rules
- Public IP addresses, user-defined routes, Azure DNS zones and custom DNS settings
- VM sizes, disks, extensions, availability options and Virtual Machine Scale Sets
- App Service TLS, backup, networking, deployment slots and scaling
- Azure Monitor metrics, diagnostic settings, Insights and alert-processing rules
- Recovery Services vaults, Backup vaults, backup reports, Site Recovery and regional failover

Project 31 must sample every checkpoint that has not already reached at least Variation evidence. Any weak item becomes a short repair lab before official practice.

## Learning and evidence standard

Every project uses this cycle:

1. Retrieve relevant knowledge before opening notes.
2. Complete a guided build when the technology is new.
3. Repeat a changed variation with fewer instructions.
4. Complete an independent task from requirements.
5. Break or diagnose one realistic fault.
6. Transfer the skill into a later project.

Completion is not mastery. Progress records must state what was verified, what evidence exists and whether help was None, Hint, Partial or Full.

Each portfolio project should normally contain:

- `README.md` for the business need, design, implementation, verification, security decisions, problems and learning
- `instructions.md` for the repeatable procedure and cleanup
- `reference/` for a concise cheat sheet and code snippets
- `scripts/` for useful Azure CLI, Bash, PowerShell or Python automation
- `terraform/` or `bicep/` when infrastructure as code adds value
- `screenshots/` for cropped, public-safe evidence

Every substantial portfolio project should also answer five questions clearly:

1. What did it cost, and what decision reduced or controlled that cost?
2. How were permissions, network exposure and sensitive data restricted?
3. What monitoring or logging proved the service was healthy?
4. Which design decisions were made, and what alternatives were rejected?
5. What broke, what evidence identified the problem and what changed afterward?

### Decision-defence standard

Every substantial project and independent mini-lab must begin with the problem
and constraints rather than the intended Azure service. Before deployment, Sat
should produce a short decision defence covering:

1. The business outcome, users and expected demand.
2. The security, region, recovery, budget and operational constraints.
3. At least two plausible designs or services considered.
4. The selected design and the specific reason it fits better.
5. The rejected alternative and the condition that would make it preferable.
6. Expected behaviour during demand growth and one component or regional failure.
7. The likely steady-state cost when the workload is quiet, not only deployment cost.

For guided work, the tutor models this reasoning. For Variation and later work,
Sat must make and defend the choice before receiving the implementation recipe.
Diagrams and AI suggestions are inputs to review, not substitutes for explaining
the constraints and trade-offs.

### Cost-verification standard

- Estimate the important cost drivers before deployment and identify a cheaper
  design that was considered.
- Record why the selected design still meets the requirement.
- Inspect the actual cost surface or relevant Azure pricing inputs after the
  build where meaningful.
- Verify budget scope, threshold and notification recipients when a budget is
  part of the lab. Do not claim an alert works merely because an assignment or
  configuration exists.
- Never generate unnecessary spend solely to trigger a notification.
- Record what stops billing after cleanup and which retained resources can still
  incur charges.

### Security pre-mortem

Before the healthy build is considered complete, answer:

1. Who can administer the resource and who can access its data plane?
2. What is publicly reachable, and why is that exposure required?
3. What happens if the workload identity, key or token is compromised?
4. Which scope, network or identity boundary limits the blast radius?
5. Which log, alert or investigation would reveal misuse?

At the end of each month, compare current evidence with the previous month using
one question: **What Azure problem can Sat now solve, explain and verify that he
could not solve 30 days earlier?** Record the answer in `PROGRESS.md` with the
help level and evidence, rather than counting videos, hours or certificates.

### Interview-defence gate

Projects 21, 25, 27, 30, 32 and 35-41 require a short interview-style defence
after the technical mastery gate. This is retrieval and communication evidence,
not a polished script. Without notes, Sat must:

1. Explain the business requirement and outcome in no more than 60 seconds.
2. Draw or reconstruct the important architecture and trust boundaries.
3. Defend the selected Azure services and one significant configuration choice.
4. Explain at least one credible rejected alternative and when it would become
   the better choice.
5. Identify the most important security boundary and the likely effect of its
   failure or compromise.
6. Describe one observed or seeded fault using symptom, evidence, hypothesis,
   controlled change and independent retest.
7. Explain the main cost drivers, what cleanup stopped billing and anything
   intentionally retained.
8. Answer one changed `what would you do if?` scenario that was not used during
   the guided build.

Record the help level and weak points honestly. A good README or successful
deployment does not pass this gate if the design cannot yet be explained and
adapted without notes. Repeat only the weak part later with changed wording.

For the strongest independent projects and capstones, place a readable architecture diagram near the top of the README. Add a short walkthrough recording only when it demonstrates the running environment safely and does not expose account or tenant information.

Do not expose tenant IDs, subscription IDs, secrets, access tokens, personal data or raw diagnostic exports in public evidence. Record expected cost and cleanup for every resource-bearing project.

## Tool fluency progression

- Use the portal first when a visual workflow helps explain the Azure object model.
- Repeat important inspections with Azure CLI and PowerShell.
- Use Bash/Zsh for variables, quoting, pipes, exit status, JSON processing and safe scripting.
- Begin hands-on Linux administration in Project 17 and repeat it in later compute and troubleshooting work.
- Use Bicep for Azure-native declarative work and Terraform for state, change planning and drift.
- Use Python where an SDK, inventory, validation or reporting task makes it useful.

### Foundation exit gates

- **Linux:** Start from a fresh disposable host, serve a simple page, break the service deliberately and find the relevant failure in the logs.
- **Networking:** Explain and troubleshoot an end-to-end path using addressing, subnetting, ports, DNS, routes and firewall rules.
- **Python:** Read structured data, use conditions, loops and functions, call an Azure API or CLI process and produce a useful inventory or report.
- **Infrastructure as code:** Read a proposed change, explain its effect, apply it safely, detect drift and reproduce the environment from version-controlled configuration.

These are capability gates, not reasons to pause the Azure projects for months. The skills are learned just in time and repeated inside later work.

## Timothy Warner supplementary passes

Timothy Warner's repository is used for changed repetition after the related project skill has first been learned and verified. It is supplementary, not the source of current Azure behaviour or exam scope.

| Repository material | Use in this roadmap | How it will be adapted |
| --- | --- | --- |
| Entra users and groups lab | Project 12 Variation; Project 33 delayed recall | Fictional identities, current Microsoft Graph syntax, available licensing and safe JML changes |
| Azure RBAC lab | Project 12 Variation; Projects 31-32 transfer | Group assignment at the narrowest useful scope instead of broad direct access |
| Storage account and Blob lab | Project 16 Variation | UK region, current storage defaults, private access and changed data-protection requirements |
| VNet and NSG lab | Project 14 Variation; Project 23 transfer | New address space, traffic matrix, no unnecessary public exposure and evidence-led troubleshooting |
| Troubleshooting scenarios | Break/fix source across Projects 12, 16, 18, 23, 27 and 31 | Present symptoms first, withhold the supplied solution, require evidence and verify current commands |
| Quick-reference cheat sheet | Retrieval aid after an independent attempt | Check syntax against current Microsoft documentation and add only commands actually used |
| Scenario questions | End-of-project recall and Project 31 mixed practice | Review answers against the current AZ-104 study guide and rewrite stale or ambiguous scenarios |
| Sample landing-zone material | Design comparison in Projects 13, 19, 25 and 32 | Treat as a conceptual reference, compare with current Cloud Adoption Framework guidance and do not assume production readiness |

Do not copy its example regions, permissions, identifiers or cleanup commands blindly. The repository states April 2025 alignment, while the current Microsoft study guide and service documentation remain authoritative.

## Projects 11 to 13: Platform foundations

### Project 11: Azure Foundations and Safe Lab Operations

**Outcome:** Navigate Azure safely, understand the hierarchy and prevent accidental cost or resource loss.

- Confirm tenant and subscription context before changes.
- Create and tag a dedicated resource group.
- Configure a budget, notification, delete lock and safe cleanup.
- Inspect the activity log and repeat queries with Azure CLI and PowerShell.
- Recreate the group and lock with Terraform.
- Diagnose stale authentication and the wrong subscription context.
- **Mastery gate:** Explain tenant, subscription, resource group and resource, then distinguish tags, locks, Policy and budgets.

### Project 12: Microsoft Entra Identity and Azure Access

**Business need:** A support reader needs temporary visibility of one resource group without permission to change it.

- Create a fictional user and security group.
- Create or invite a fictional external user and compare member and guest properties.
- Inspect licence assignment and availability without enabling a paid licence blindly.
- Configure and test self-service password reset only within the tenant's available licence and a safe test scope.
- Assign Reader to the group at resource-group scope.
- Verify allowed viewing and denied changes.
- Simulate a leaver by removing membership and proving access loss.
- Query users, groups, memberships and role assignments with CLI and PowerShell.
- Diagnose a mistaken direct assignment and missing membership.
- **Mastery gate:** Implement a changed group-based RBAC scenario and explain principal, role, scope and inheritance.

### Project 13: Azure Governance and Landing-Zone Controls

**Business need:** A fictional organisation needs consistent regions, tags, cost ownership and protection controls before teams deploy resources.

- Inspect the tenant root group and subscription hierarchy.
- Define UK South as primary and UK West as recovery.
- Use an isolated test scope with known ownership and cleanup.
- Apply Policy for required tags and allowed locations.
- Compare audit, deny, append and modify before enforcement.
- Create a compliant deployment and controlled non-compliant test.
- Query assignments and compliance with CLI and PowerShell, then reproduce suitable controls with Terraform.
- Diagnose inheritance, scope, exemptions and remediation.
- **Security rule:** Never test deny policy at tenant root without a safe scope and rollback plan.
- **Mastery gate:** Design a changed assignment, predict its blast radius and verify the result.

## Projects 14 to 18: Networking, storage and compute

### Project 14: Virtual Networks, Subnets and NSGs

**Business need:** A three-tier workload needs separate web, application and management boundaries without unnecessary public exposure.

- Plan non-overlapping address spaces and subnets.
- Create a VNet, subnets and NSGs and explain default rules.
- Use application security groups and evaluate effective security rules.
- Build a traffic matrix before adding rules, then explain NSG priority and stateful behaviour from observed flows.
- Compare Azure Bastion, just-in-time access and tightly restricted public-IP administration, then retain the least-exposed suitable design.
- Never expose RDP or SSH to `0.0.0.0/0`. Restrict any temporary public management test to the learner's current source IP and remove it immediately after verification.
- Permit an intended flow and deny an unintended flow.
- Prove that allowing TCP 443 and denying TCP 80 is port filtering, not web-content inspection or proof that an HTTPS destination is trustworthy.
- Inventory the network with CLI, PowerShell and Bash JSON queries.
- Diagnose an incorrect CIDR, rule priority conflict and wrong association.
- Repeat the topology from a changed address plan.
- **Mastery gate:** Produce a subnet and NSG design from a traffic requirement.

### Project 15: VNet Peering, Private DNS and Private Endpoints

**Business need:** An application network must reach shared services without traversing the public internet.

- Create and peer two non-overlapping VNets.
- Verify peering direction, forwarded traffic settings and effective routes.
- Create a private endpoint for a suitable PaaS service.
- Configure a service endpoint as a changed comparison and explain its trust boundary.
- Configure and link the required private DNS zone.
- Create an Azure public DNS zone and records in a changed exercise, then compare public, private and custom DNS resolution.
- Restrict the public service path after private access works.
- Diagnose overlapping address spaces, one-sided peering and a missing DNS link.
- **Mastery gate:** Explain peering, service endpoints and private endpoints, including DNS consequences.

### Project 16: Secure Azure Storage and Data Protection

**Business need:** A team needs private document storage with least-privilege access, recoverability and controlled retention.

- Choose the appropriate storage service and redundancy option.
- Configure secure transfer, access tiers, versioning, soft delete and lifecycle management.
- Use Entra authorisation and storage data-plane roles.
- Create a narrowly scoped SAS, a stored access policy and an access-key test, then compare their risks and revocation paths.
- Configure identity-based Azure Files access and practise Storage Explorer, AzCopy and Azure File Sync where the environment supports them.
- Configure encryption and a small object-replication test.
- Integrate private access using Project 15 patterns.
- Upload, list, restore and download test data with CLI and PowerShell.
- Diagnose control-plane versus data-plane access, network and DNS failures.
- Reproduce the secure baseline with Terraform or Bicep.
- **Mastery gate:** Restore changed or deleted data and justify protection and access choices.

### Project 17: Linux VM Administration and Secure Access

**Business need:** An internal service needs a Linux host with restricted administration, patching and auditable configuration.

- Predict and inventory the NIC, disk, VNet, subnet, NSG and any public IP created with the VM.
- Deploy a Linux VM without broad inbound management exposure.
- Use SSH keys and compare Bastion, just-in-time access and a short-lived source-IP-restricted public SSH variation.
- Prove access before and after the management rule is removed, then verify that no unintended public management path remains.
- Practise users, groups, permissions, packages, services, processes and logs.
- Attach and persistently mount a data disk.
- Write a Bash health-check script with meaningful exit codes.
- Use cloud-init or a VM extension for repeatable configuration.
- Compare running, stopped and deallocated states, including attached resources that can continue to incur charges.
- Diagnose permissions, a stopped service, a full filesystem and failed DNS.
- **Mastery gate:** Recover a broken service and explain the evidence used to isolate it.

### Project 18: Windows VMs, Availability and Governance

**Business need:** A line-of-business workload needs Windows servers, controlled access and a documented availability choice.

- Predict and inventory the dependent resources created with the VM before accepting the deployment.
- Deploy governed Windows compute with secure administration and no internet-wide RDP rule.
- Compare a short-lived source-IP-restricted RDP rule with Azure Bastion and just-in-time access, then remove the temporary public path.
- Prove that RDP succeeds only under the intended rule and fails after its removal.
- Select sizes and disks from workload requirements and change them safely.
- Build a small Virtual Machine Scale Set and compare it with availability sets and availability zones.
- Configure extensions, updates, disks and boot diagnostics.
- Use Azure Update Manager to assess and schedule updates, then verify guest state.
- Run the Windows VM lifecycle from provisioning through patch assessment,
  maintenance, resize or disk change, deallocation and retirement. Use a change
  record, rollback decision and post-change health checks rather than treating
  patching as a one-click task.
- Inspect guest and Azure state with PowerShell.
- Compare running, stopped and deallocated states and identify separately billed resources such as disks and public IP addresses.
- Recreate the baseline with Bicep or Terraform.
- Diagnose extension, size, quota and region problems.
- **Mastery gate:** Choose and justify an availability design from recovery and cost requirements.

## Projects 19 to 22: Infrastructure as code and application platforms

### Project 19: ARM Templates and Bicep

- Read ARM template structure and explain idempotency.
- Create a parameterised Bicep deployment with modules and outputs.
- Preview changes with what-if before deployment.
- Deploy and inspect using Azure CLI and PowerShell.
- Store the deployment on a feature branch and use a small GitHub Actions
  workflow to lint or build the Bicep and produce a reviewed `what-if` result.
- Open and review a pull request before merging the infrastructure change.
- Diagnose validation, dependency, API-version and scope errors.
- **Mastery gate:** Modify a deployment from requirements and predict its what-if result.

### Project 20: Terraform Foundations, State and Drift

- Structure providers, variables, locals, resources and outputs clearly.
- Initialise, format, validate, plan and apply a small environment.
- Inspect dependencies and state without exposing sensitive values.
- Move state to a secured Azure backend with locking.
- Import or reconcile an existing resource, then refactor the resulting configuration into a reusable module without losing state ownership.
- Compare Terraform import with Azure export tooling and portal ARM JSON. Treat generated configuration as a starting point, then validate every argument and plan rather than trusting an LLM conversion.
- Create controlled drift, detect it and choose whether code or infrastructure should win.
- Add an introductory GitHub Actions workflow that runs Terraform formatting,
  validation and a reviewed plan without automatically applying it.
- Practise one feature branch, pull request and safe merge so source-control and
  pipeline habits begin before the advanced delivery project.
- Diagnose authentication, provider, dependency and state-lock errors.
- **Mastery gate:** Identify and correct destructive changes in an unfamiliar plan.

### Project 21: App Service Deployment and Production Operations

**Business need:** An internal application needs a repeatable Azure platform,
staged releases, private data access, secrets-free authentication and useful
diagnostics. The delivery team also needs a clear hosting recommendation that
non-technical stakeholders can understand.

- Deploy an App Service plan and web app.
- Configure deployment slots, settings, health checks and an appropriate scale choice.
- Configure TLS, App Service networking and backup or restore where the selected tier supports them.
- Create an Azure SQL logical server and database for operational practice.
- Configure Microsoft Entra authentication, restricted or private network
  access, auditing and appropriate diagnostic settings for Azure SQL.
- Compare Azure SQL Database, SQL Managed Instance and SQL Server on an Azure
  VM from cost, compatibility and operational requirements.
- Use managed identity to access Azure SQL or another Azure service without
  embedding application credentials.
- Connect the application, Azure SQL and suitable storage through private
  connectivity and prove the intended DNS and access paths.
- Recreate the platform with Bicep or Terraform.
- Create a GitHub Actions or Azure Pipelines workflow that validates the
  infrastructure and deploys the application to a staging slot before an
  approved promotion or slot swap.
- Use a feature branch and pull request, retain the plan or `what-if` evidence,
  and diagnose one failed pipeline or deployment from its logs.
- Diagnose startup, configuration, identity, DNS and slot-swap problems.
- Capture logs and prove rollback.
- Export or restore test data and verify that the application still functions.
- Produce a short architecture decision record containing the business need,
  constraints, chosen design, two rejected alternatives, security and cost
  implications, operational ownership and a plain-English stakeholder summary.
- **Mastery gate:** Perform a changed staged deployment and recovery with minimal hints.

### Project 22: Azure Containers and Managed Workloads

**Business need:** A stateless service must be packaged consistently without managing a full VM estate.

- Build and inspect a simple container image.
- Store it in Azure Container Registry with controlled access.
- Run a deterministic image vulnerability scan and compare the result with current Defender for Cloud registry assessment where licensing and cost permit.
- Deploy with Container Instances or Container Apps.
- Build, scan, publish and deploy the image through a small GitHub Actions or
  Azure Pipelines workflow, with a pull request before changing the deployed
  version.
- Configure identity, ingress, environment values and scaling.
- Compare the choice with AKS and App Service containers.
- Diagnose image pull, registry permission, port and health failures.
- **Mastery gate:** Select a container hosting option from operational requirements and defend the trade-offs.

## Projects 23 to 30: Advanced networking, security and operations

### Project 23: Load Balancing and Network Troubleshooting

- Configure a Standard Load Balancer, backend pool, health probe and rule.
- Configure and query public IP addresses, user-defined routes and custom DNS where the scenario needs them.
- Verify healthy distribution across back ends.
- Use Network Watcher, connection troubleshoot, IP flow verify and effective routes.
- Trace an RDP or SSH failure through addressing, NSG association, effective rules, routes and guest-service state.
- Enable a short-lived virtual network flow log, inspect the retained records and
  use Traffic Analytics only when its ingestion cost is justified. Do not create
  retired NSG flow logs.
- Break a probe, NSG rule or route and diagnose it without guessing.
- Compare Load Balancer with Application Gateway and Front Door.
- **Mastery gate:** Identify a failed connection layer and present supporting evidence.

### Project 24: Application Gateway, WAF and Front Door

**Business need:** An internet-facing application needs TLS termination, path routing, attack protection and a global delivery option.

- Configure Application Gateway listeners, probes, routing and TLS handling.
- Enable WAF in detection mode before safe enforcement.
- Compare platform DDoS protections and Azure DDoS Protection plans before deciding whether the lab needs a paid plan.
- Compare regional Application Gateway with global Front Door.
- Model or deploy a cost-controlled API path using Application Gateway WAF in front of API Management. Compare OAuth, managed identity, certificates and subscription keys, and prevent clients from bypassing the intended gateway.
- Add Front Door where the scenario and cost justify it.
- Complete a short static-content variation using Blob Storage and the current
  Front Door Standard or Premium platform. Compare a public static-website
  endpoint with a secured Blob origin, and document direct-origin exposure,
  caching, propagation, cost and cleanup.
- Diagnose certificate, probe, host-header and route problems.
- Document false-positive handling.
- **Mastery gate:** Design delivery from security, latency and availability requirements.

### Project 25: Hub-and-Spoke Networking, Routing and Azure Firewall

**Business need:** Multiple workloads need shared services, restricted east-west traffic and centrally governed egress.

- Create a hub and at least two spokes with non-overlapping addresses.
- Configure peering, route tables and controlled transit.
- Deploy Azure Firewall, or model it when cost prevents a long-lived deployment.
- Centralise DNS and shared management services.
- Verify effective routes and next hops.
- Diagnose asymmetric routing, route propagation and blocked egress.
- Build the topology with Terraform or Bicep modules and destroy expensive resources promptly.
- **Mastery gate:** Produce and validate a changed design from a traffic-flow matrix.

### Project 26: Hybrid Connectivity, VPN and DNS

**Business need:** A fictional organisation is extending an existing network into Azure without making internal services public.

- Design site-to-site VPN addressing, gateways and routes.
- Deploy a cost-controlled VPN lab or documented simulation.
- Configure local network gateway and connection objects.
- Implement or model DNS forwarding and Private Resolver patterns.
- Compare VPN Gateway, ExpressRoute and Virtual WAN.
- Diagnose prefixes, shared keys, routes and DNS forwarding.
- **Mastery gate:** Explain an end-to-end packet and DNS path from on-premises to a private Azure service.

### Project 27: Azure Monitor, KQL and Operational Response

**Business need:** Operations needs meaningful alerts and evidence without unlimited, costly data collection.

- Configure a Log Analytics workspace and deliberate retention.
- Add selected diagnostic settings, alerts, action groups and a workbook.
- Interpret platform metrics and configure VM, storage and network Insights.
- Add an alert-processing rule and compare it with changing the underlying alert rule.
- Review Service Health and Azure Advisor recommendations and record which actions are relevant.
- Write KQL for availability, errors, changes and security events.
- Correlate a temporary management-access change with Activity Log, network and guest evidence, then confirm that the access path was removed.
- Trigger safe test signals and prove notification and investigation flow.
- Diagnose missing telemetry, wrong scope, ingestion delay and noisy alerts.
- Estimate monitoring cost and remove unnecessary collection.
- Use Azure Resource Graph to create a cross-resource inventory and export a public-safe operational report.
- Build a small Python inventory or health-report tool from Azure SDK data or sanitised Azure CLI JSON.
- **Mastery gate:** Investigate an unfamiliar alert and present an evidence-based timeline.

### Project 28: Defender for Cloud and Security Posture

**Business need:** The infrastructure team needs a repeatable way to discover insecure configuration, prioritise remediation and explain residual risk.

- Review Defender for Cloud coverage, current plans and likely charges before enabling paid features.
- Inspect the Microsoft cloud security benchmark, recommendations and secure score.
- Trace selected recommendations back to the affected Azure resources and policies.
- Prioritise by exposure, impact and effort rather than chasing a score alone.
- Remediate safe findings, verify the changed resource and record accepted risks.
- Process one recommendation as a vulnerability-remediation ticket: record the
  affected asset, exposure, priority, owner, controlled change, independent
  retest and residual risk or exception.
- Compare Foundational CSPM capabilities with paid Defender plans and disable trial features that are not being retained.
- Query security recommendations or assessments with Azure CLI, PowerShell or Resource Graph where supported.
- **Mastery gate:** Triage an unfamiliar set of recommendations and produce an evidence-based remediation plan.

### Project 29: Microsoft Sentinel and Security Investigation

**Business need:** Security operations needs centralised logs and a repeatable investigation process for suspicious Azure activity.

- Plan a narrowly scoped Log Analytics and Sentinel deployment with ingestion cost controls.
- Connect appropriate Azure activity and identity-related data sources where licensing permits.
- Write KQL queries for privileged changes, failed access and unusual resource operations.
- Create a safe scheduled analytics rule and investigate the resulting incident.
- Generate a controlled synthetic signal or use an isolated training dataset;
  do not expose a deliberately vulnerable application to the public internet
  merely to create portfolio evidence.
- Build an investigation timeline that separates observations, hypotheses and confirmed findings.
- Use automation rules or a playbook only after the manual response is understood.
- Diagnose missing data, incorrect time range, permissions and noisy detections.
- **Mastery gate:** Investigate a changed alert, explain its evidence and recommend containment and prevention.

### Project 30: Backup, Restore and Disaster Recovery

**Business need:** A service has defined RPO and RTO requirements and needs tested restoration evidence.

- Translate requirements into recovery, retention and regional choices.
- Protect a suitable workload with security controls and soft delete.
- Create and distinguish a Recovery Services vault and a Backup vault where supported.
- Perform item-level and full-resource recovery where practical.
- Design a UK South to UK West recovery scenario.
- Configure Azure Site Recovery, perform a controlled test failover and document failback requirements where cost and resource support permit.
- Query protection, jobs, recovery points and alerts.
- Configure and interpret backup reports and alerts.
- Test recovery in isolation and validate restored data.
- **Mastery gate:** Run a recovery exercise and report whether its objectives were met.

## Projects 31 to 42: Administrator integration, enterprise security, delivery and capstones

### Project 31: Azure Administrator Scenario Challenge

**Outcome:** Make the current AZ-104 objectives feel like familiar operational work before using the official practice assessment.

- Work through several short tickets covering identity, governance, storage, compute, networking and monitoring.
- Start each ticket by checking context, scope, cost and risk.
- Choose between the portal, Azure CLI, PowerShell and Bicep based on the task.
- Interpret JSON, object output, effective access, effective routes, activity logs and deployment results.
- Complete service-selection and troubleshooting scenarios without exact procedures.
- Include at least one wrong-scope fault, one access fault, one network fault and one monitoring or recovery fault.
- Work selected scenarios as realistic 2nd/3rd-line tickets with impact,
  evidence, hypothesis, escalation boundary, user or stakeholder update,
  resolution, rollback and closure notes.
- Apply lightweight ITIL concepts where useful: distinguish incident, service
  request, problem and change; link a recurring incident to a problem record;
  and record a known error or prevention action without turning the technical
  lab into a process-writing exercise.
- Map every result to the current official AZ-104 study guide and create repair mini-labs for weak areas.
- Complete timed sets from the official Practice Assessment, keep a correction log for every incorrect or uncertain answer and verify disputed details against current Microsoft documentation.
- Practise locating precise facts in Microsoft Learn under time pressure without using documentation as a substitute for understanding the scenario.
- **Mastery gate:** Complete a fresh mixed scenario with no procedural help and explain why rejected options were unsuitable.

### Project 32: Capstone 1 - Governed Azure Administrator Environment

**Business need:** A small organisation needs a governed application environment with ownership, least privilege, private networking, monitoring and recovery.

Required capabilities:

- hierarchy, naming, tags, budgets, locks and Policy
- Entra groups and least-privilege RBAC
- segmented networking and private service access
- a compute or PaaS workload with secure administration
- infrastructure as code and controlled change review
- monitoring, alerting, backup and tested recovery
- cost estimate, cleanup and residual-risk statement

Work from requirements, not a click-by-click guide. Submit a design, implementation evidence, verification, one break/fix record and honest limitations.

### Project 33: Zero Trust Identity and JML

- Model joiner, mover and leaver processes with group-based access.
- Define privileged and standard personas.
- Create and compare an enterprise application, app registration, service
  principal and managed identity, including their ownership and lifecycle.
- Integrate a disposable test application for single sign-on and use it to
  explain SAML, OAuth 2.0 and OpenID Connect. Compare these with LDAP and
  Kerberos in traditional AD DS environments without treating the protocols as
  interchangeable.
- Use administrative units, access reviews, entitlement management or PIM where licensing permits.
- Create an access-package or equivalent approval and recertification workflow
  where licensing permits, then prove that expired or rejected access is absent.
- Design Conditional Access in report-only mode before enforcement.
- Review authentication methods, MFA and passwordless options, and test a
  narrowly scoped modern-authentication policy with an emergency-access boundary.
- Document emergency access and service-account boundaries.
- Diagnose stale membership, inherited privilege and policy conflicts.
- Investigate sign-in logs, audit logs, Conditional Access results, token claims,
  authentication failures and risky sign-in evidence where licensing permits.
- Design a hybrid-identity variation covering Microsoft Entra Connect Sync and
  Cloud Sync, source of authority, matching, accidental-deletion protection and
  staged migration. Compare password hash synchronisation, pass-through
  authentication and federation, then diagnose a safe synchronisation-failure
  scenario where a suitable AD DS environment is available.
- Add a licence-dependent Microsoft 365 crossover: assign and remove a test
  licence through group-based membership, inspect the resulting service access
  and include Microsoft 365 group administration in the JML evidence where the
  tenant supports it.
- Add an Intune and Conditional Access variation where licensing permits:
  model a device-compliance requirement in report-only or a test-only scope,
  inspect the sign-in result and preserve an emergency-access boundary. Use a
  documented design exercise when a suitable licence is unavailable.
- Produce an identity solution design, configuration guide, deployment plan,
  test results and live-service support handover. Include a plain-English
  stakeholder explanation and clearly label anything modelled rather than
  deployed because of licensing.
- **Mastery gate:** Process a changed JML scenario and prove obsolete access is removed.

### Project 34: Key Vault, Managed Identity and Secrets

- Configure Key Vault protection, restricted networking and Azure RBAC.
- Give a managed identity the minimum required data-plane role.
- Retrieve a secret without storing credentials in code.
- Add rotation, expiry and monitoring decisions.
- Complete a controlled rotation exercise and prove that the workload retrieves the new secret version without committing or printing the value.
- Prove authorised access and denied overreach.
- Diagnose identity, role, network and object-version failures.
- Scan the project for committed secrets before publication.
- **Mastery gate:** Replace an insecure secret flow and explain every trust boundary.

### Project 35: Enterprise Terraform Structure and State

**Business need:** A platform team needs reusable Azure infrastructure across
multiple environments without losing ownership of state or relying on one
engineer's local machine.

- Refactor an understood Azure design into small reusable modules with clear
  inputs, outputs, version constraints and environment-specific values.
- Separate development and production-style inputs without duplicating the
  resource definitions.
- Move state to a protected Azure Storage backend with encryption, versioning,
  locking and least-privilege data-plane access.
- Inspect state safely without exposing sensitive values and document which
  resources Terraform owns.
- Import and refactor an existing resource without replacement or loss of state
  ownership.
- Introduce controlled drift and decide whether configuration or the live
  environment should win.
- Simulate a safe lock, interrupted operation or damaged local working copy,
  then follow a documented state-recovery procedure.
- Review a plan containing replacement or destruction and explain its dependency
  and blast-radius consequences before approval.
- **Mastery gate:** Recover and modify a modular, remotely stored Terraform
  environment without unsafe state manipulation.

### Project 36: Secure Terraform Delivery with GitHub Actions

**Business need:** Infrastructure changes must be reviewed, authenticated without
stored cloud secrets and promoted through an auditable delivery process.

- Practise feature branches, pull requests and one controlled merge conflict
  before promotion between environments.
- Create a GitHub Actions workflow that runs Terraform formatting, validation,
  linting and a reviewed plan on pull requests.
- Authenticate GitHub to Azure with OpenID Connect workload identity federation
  instead of a stored client secret.
- Give the delivery identity only the Azure and Terraform-state permissions
  required for its environment.
- Publish a sanitised plan summary for review without exposing state, identifiers
  or sensitive values.
- Separate plan review from apply and require an approved GitHub environment or
  named reviewer before deployment.
- Protect the default branch and prevent an unreviewed or unauthorised workflow
  from applying infrastructure.
- Inspect failed workflow runs through GitHub and the `gh` CLI. Diagnose seeded
  identity-scope, regional-quota, runner-capacity and connectivity failures from
  evidence before changing the pipeline.
- Add drift detection, rollback decisions and a controlled promotion between
  development and production-style environments.
- Add an optional LLM explanation stage only after deterministic checks. Keep
  its output advisory, exclude credentials and Terraform state, and never use it
  as the sole approval or security gate.
- **Mastery gate:** Deliver a changed Terraform environment through a reviewed,
  secretless and independently verified pipeline.

### Project 37: GitHub Advanced Security and Software Supply Chain

**Business need:** The engineering team must prevent leaked credentials,
vulnerable code, unsafe dependencies and insecure infrastructure changes from
reaching the default branch.

- Use a disposable public training repository for features available without a
  paid private-repository licence, and confirm current billing before enabling
  any trial or paid GitHub security product.
- Begin with one guided GitHub Actions workflow so the workflow anatomy is
  understood before several security products are combined: pull-request event,
  job, hosted runner, checkout step, scanner step, permissions and check result.
- Add Gitleaks as the first scanner. Pin third-party actions to reviewed full
  commit SHAs, declare least-privilege `GITHUB_TOKEN` permissions and use only a
  documented fake credential pattern.
- Trigger a failed pull-request check, inspect the workflow and check logs,
  remove the fake value, rerun the workflow and retain evidence of the clean
  result. Configure branch protection so the failed required check genuinely
  prevents merging.
- Compare scanning only the pull-request change with scanning repository
  history, and explain why `.gitignore` is not a secret-management control.
- Enable and test secret scanning and push protection using only documented fake
  credentials or safe custom patterns.
- Add a small deliberately vulnerable sample application and configure CodeQL
  code scanning on pull requests.
- Configure Dependabot alerts and version-update pull requests for a controlled
  outdated dependency.
- Add dependency review and demonstrate the difference between detecting a
  vulnerable dependency and blocking its introduction.
- Scan Terraform with an appropriate deterministic tool such as Checkov or
  Trivy, because CodeQL is not a replacement for IaC-specific analysis.
- Publish and consume a small package through GitHub Packages or Azure Artifacts.
  Restrict feed permissions, control upstream sources and pin dependencies.
- Create pull-request security gates with a documented severity and exception
  policy. Do not treat every finding as equal.
- Triage a true positive, false positive and accepted risk, then remediate one
  finding and independently prove the clean rerun.
- Export a sanitised finding into an operational ticket containing owner,
  evidence, controlled change, retest and residual risk.
- **Mastery gate:** Diagnose and remediate a seeded software-supply-chain finding
  without weakening or bypassing the security gate.

### Project 38: AKS Platform Operations, GitOps and Container Security

**Business need:** Multiple teams need a governed Kubernetes platform with isolated workloads, repeatable delivery, useful monitoring and accountable cost allocation.

- Design the AKS dependency graph, node pools, networking, identity, ACR access and upgrade strategy before deployment.
- Deploy a cost-controlled AKS cluster only after estimating node, storage, load-balancer, monitoring and Defender charges. Remove it promptly when the exercise is complete.
- Deploy changed workloads into separate namespaces and apply namespace-scoped RBAC, quotas, limits and network policies.
- Use workload identity and Key Vault integration instead of embedding Kubernetes secrets or cloud credentials in manifests.
- Implement pull-based GitOps with the Azure-supported Flux v2 extension. Compare its reconciliation and multi-tenancy model with Argo CD rather than treating the tools as interchangeable.
- Use an app-of-apps or equivalent layered repository design only after a simple single-workload reconciliation is understood.
- Integrate ACR vulnerability assessment and a deterministic pipeline scanner. Triage findings and prove a rebuilt image replaces a vulnerable version.
- Configure Container insights and compare Azure-native telemetry with a third-party platform such as Datadog at the design level before adding another paid collector.
- Enable AKS cost analysis where the selected tier supports it, then explain namespace allocation, OpenCost-derived data and the difference between allocation and the Azure invoice.
- Diagnose image-pull failure, pending pods, failed readiness, DNS, network-policy denial, GitOps drift and an unhealthy node.
- **Mastery gate:** Deliver a changed namespaced workload through GitOps, prove isolation and identity boundaries, diagnose one seeded failure and produce cost and cleanup evidence.

### Project 39: Golden Image and Compute Gallery Pipeline

- Define a secure Linux or Windows image baseline.
- Build with Azure VM Image Builder or suitable automation.
- Publish versions to Azure Compute Gallery.
- Test before promotion and record provenance.
- Deploy from the approved image and define rollback and retirement.
- Diagnose customisation, replication and version-selection failures.
- **Mastery gate:** Promote or reject an image version from test evidence.

### Project 40: Capstone 2 - Secure Cloud Platform

**Business need:** A product team needs a repeatable platform for an internet-facing application while the platform team retains governance and auditability.

Required capabilities:

- segmented networking with Application Gateway or Front Door and WAF
- private service access and private DNS
- managed identity and Key Vault integration
- App Service or managed container workload
- Terraform or Bicep modules delivered through validation gates
- monitoring, alerting, backup and rollback
- threat model, cost controls and public-safe evidence

Demonstrate a deployment, a denied insecure path, a controlled release and a recovery action.

### Project 41: Capstone 3 - Hybrid Operations and Incident Recovery

**Business need:** A fictional organisation has on-premises dependencies, Azure workloads and an incident affecting connectivity, identity and availability.

Required capabilities:

- hybrid routing and DNS diagnosis
- identity and least-privilege access review
- Linux and Windows operational checks
- monitoring queries and an incident timeline
- backup or regional recovery
- infrastructure-as-code repair and drift handling
- stakeholder update, root-cause analysis and follow-up controls

Start with incomplete documentation and seeded faults. Restore the critical service, prove recovery and explain how to prevent recurrence.

### Project 42: Optional Secure Azure AI Platform

**Business need:** A team wants to evaluate a managed AI application without
exposing organisational data, credentials or an uncontrolled cost surface.

- Inspect Azure AI Foundry capabilities, regions, quotas, pricing inputs and
  responsible-AI boundaries before deploying a model or agent.
- Design a small authorised use case and record why a conventional application
  would or would not meet the requirement.
- Use managed identity and Key Vault rather than embedding credentials.
- Restrict data, tool and network access using least privilege and private access
  where supported and affordable.
- Configure content-safety, logging, monitoring, token or request budgets and a
  prompt-and-output data-handling policy.
- Test safe prompt-injection, excessive-agency and unintended-data-disclosure
  scenarios without using real confidential information.
- Deliver the configuration through a reviewed pipeline and keep deterministic
  security checks authoritative over any model-generated explanation.
- Capture cost and cleanup evidence and clearly distinguish a learning
  evaluation from a production AI platform.
- **Mastery gate:** Explain and verify every identity, data, network, tool and
  cost boundary in a changed AI workload design.

## Certification and consolidation checkpoint

After Project 31 for an initial readiness check, after Project 32 for the core administration capstone, or after Project 41 for the broadest preparation:

1. Work through the current official [AZ-104 study guide](https://learn.microsoft.com/credentials/certifications/resources/study-guides/az-104).
2. Complete relevant Microsoft Learn administrator paths and sandbox exercises.
3. Use official practice assessments to identify weak domains.
4. Record every incorrect or uncertain answer, explain why rejected options are unsuitable and verify the correction against current Microsoft documentation.
5. Repair each weak domain with a changed mini-lab rather than memorising answers.
6. Use a current study-cram resource only for final retrieval after the practical work is complete.
7. Use Timothy Warner only as supplementary explanation and practice.

Finishing projects is strong preparation, not automatic proof of exam readiness. Readiness also requires broad scenario recognition, timed practice and independent troubleshooting.

## Primary references

- [Microsoft Certified: Azure Administrator Associate](https://learn.microsoft.com/credentials/certifications/azure-administrator/)
- [AZ-104 study guide](https://learn.microsoft.com/credentials/certifications/resources/study-guides/az-104)
- [Azure Architecture Center](https://learn.microsoft.com/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/azure/well-architected/)
- [Azure security documentation](https://learn.microsoft.com/azure/security/)
- [Azure CLI documentation](https://learn.microsoft.com/cli/azure/)
- [Azure PowerShell documentation](https://learn.microsoft.com/powershell/azure/)
- [Azure Verified Modules](https://azure.github.io/Azure-Verified-Modules/)
- [Terraform on Azure documentation](https://learn.microsoft.com/azure/developer/terraform/)
- [Timothy Warner training](https://www.youtube.com/@TimothyWarner)
