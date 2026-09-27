# Azure and AZ-104 Curriculum

The detailed checklist is in the [progressive Azure roadmap](../../assets/azure-roadmap.md).

| Stage | Projects | Real-world outcome | Evidence | Status |
| --- | --- | --- | --- | --- |
| A: Platform control | 11-13 | Operate Azure safely and govern identity, access, scope, policy, and cost | Context checks, RBAC tests, policy compliance, budget and landing-zone documentation | Current |
| B: Core networking and compute | 14-18 | Build and repair segmented networks, private access, storage, Linux and Windows compute | Diagrams, traffic tests, recovery tests, break/fix records and automation | Pending |
| C: Code and application platforms | 19-22 | Use Bicep and Terraform and operate PaaS and container workloads | What-if and plan reviews, state and drift evidence, deployments and rollback | Pending |
| D: Advanced networking, security and operations | 23-30 | Deliver application traffic, hybrid connectivity, security monitoring and recovery | Packet paths, WAF and routing evidence, Defender remediation, Sentinel investigation, KQL, alerts and restores | Pending |
| E: Administrator integration | 31 | Integrate the current AZ-104 domains through changed operational scenarios | Independent tickets, mixed faults, objective mapping and repair mini-labs | Pending |
| F: Core administration capstone | 32 | Build and operate a coherent governed environment with decreasing help | Independent design, implementation, break/fix, recovery and explanation | Pending |
| G: Enterprise security and platform projects | 33-39 | Deepen identity, secrets, Terraform engineering, secure delivery, software-supply-chain security, Kubernetes operations and secure compute images | Independent security-first project evidence | Pending |
| H: Advanced capstones and optional AI security | 40-42 | Integrate secure platforms, operate a hybrid-style incident and optionally evaluate a governed AI workload | Architecture, controlled delivery, diagnosis, recovery, root-cause and threat evidence | Pending |
| I: Microsoft consolidation | Official paths and Applied Skills | Connect formal Microsoft material to practical experience and expose gaps | Module checks, Applied Skills and targeted repair drills | Pending |
| J: Certification readiness | Review | Use AZ-104 as an optional confidence and coverage checkpoint | Objective mapping, weak-area repairs and timed practice | Future |

## Microsoft Applied Skills Checkpoints

Applied Skills are practical consolidation points, not substitutes for the
projects. Complete the relevant project work first, attempt the interactive
assessment without a click-by-click guide, then use any weak areas to create a
small repair lab.

| Complete after | Applied Skill | Why it sits here |
| --- | --- | --- |
| Project 16 | [Secure storage for Azure Files and Azure Blob Storage](https://learn.microsoft.com/en-us/credentials/applied-skills/secure-storage-azure-files-azure-blob-storage/) | Project 16 supplies the storage security, identity, networking and recovery practice. |
| Project 18 | [Get started with Azure management tasks](https://learn.microsoft.com/en-us/credentials/applied-skills/get-started-with-azure-management-tasks/) | Projects 11-18 establish the subscription, network, storage and VM administration skills assessed. |
| Project 25 | [Configure secure access to your workloads using Azure networking](https://learn.microsoft.com/en-us/credentials/applied-skills/configure-secure-workloads-use-azure-virtual-networking/) | Projects 14, 15, 23 and 25 build progressively deeper secure-networking experience. |
| Project 27 | [Deploy and configure Azure Monitor](https://learn.microsoft.com/en-us/credentials/applied-skills/deploy-and-configure-azure-monitor/) | Project 27 covers Log Analytics, telemetry, alerts, VM monitoring and network monitoring. |
| Project 28 | [Secure Azure services and workloads with Microsoft Defender for Cloud regulatory compliance controls](https://learn.microsoft.com/en-us/credentials/applied-skills/secure-azure-services-and-workloads-with-microsoft-defender-for-cloud-regulatory-compliance-controls/) | Project 28 provides the Defender for Cloud and compliance-remediation foundation. |
| Project 33 | [Get started with identities and access using Microsoft Entra](https://learn.microsoft.com/en-us/credentials/applied-skills/get-started-with-identities-and-access-using-microsoft-entra/) | Project 12 introduces Entra and RBAC; Project 33 adds the identity, authentication and governance depth needed for a confident attempt. |
| Project 34 | [Get started with cloud security and monitoring tasks](https://learn.microsoft.com/en-us/credentials/applied-skills/get-started-with-cloud-security-and-monitoring-tasks/) | By this point Defender for Cloud, Azure Firewall, Azure Monitor and Key Vault have all been practised. |
| Project 36 | [Implement security through a pipeline using Azure DevOps](https://learn.microsoft.com/en-us/credentials/applied-skills/implement-security-through-pipeline-using-devops/) | Attempt only after ordinary CI/CD, pipeline identity, permissions and protected resources are understood. |
| Phase 4 Hybrid Infrastructure, before its identity capstone | [Administer Active Directory Domain Services](https://learn.microsoft.com/en-us/credentials/applied-skills/administer-active-directory-domain-services/) | The hybrid phase supplies Windows Server, DNS, PowerShell, domain controllers, AD objects, Group Policy and AD security practice. |

Azure Arc-enabled Servers remains a hands-on hybrid learning path rather than a
scheduled Applied Skills assessment. Complete it in Phase 4 after independently
onboarding and operating a non-Azure server, and confirm the current Microsoft
credential catalogue before treating any future Arc assessment as available.

## Project Learning Pattern

Every substantial project is security-first. Before deployment, identify the
identities, trust boundaries, public exposure, sensitive data, secrets,
permissions and likely blast radius. During the build, apply least privilege
and secure defaults. Before completion, verify logging, recovery, cleanup and
the absence of unintended access. Security is part of each design decision,
not a separate hardening task added at the end.

Business-scenario judgement is introduced progressively. Early scenarios give
the company profile, workload, needs and constraints explicitly, then teach the
learner to classify them before selecting services. Later projects provide
less structure and require increasingly independent trade-off analysis,
alternative rejection and stakeholder explanation.

| Project task | Learn first | Practice | Project evidence |
| --- | --- | --- | --- |
| Understand the service | Just-in-time concept and focused official documentation | Retrieval question and small guided drill | Explanation in the learner's own words |
| Configure it | Resource model, dependencies, security, cost | Portal task | Implementation evidence |
| Prove it works | Expected state and read-only verification | PowerShell or Azure CLI query | Independent verification output |
| Diagnose it | Common failure boundaries and observability | Controlled break/fix | Symptoms, hypothesis, evidence, cause, fix and retest |
| Automate it | Imperative compared with declarative approaches | PowerShell, CLI, Bicep, Terraform or Python where useful | Public-safe code and repeatable instructions |
| Retain it | Mental model and service-selection trade-offs | Spaced recall and changed scenario | Delayed explanation or independent rebuild |

## Fluency Cycle

Important skills move through these passes. Not every skill needs all five as a
separate lab because later projects can provide the variation, break/fix, or
transfer evidence.

| Pass | Tutor support | Learner challenge | Move forward when |
| --- | --- | --- | --- |
| Guided | Full or Partial | Follow, verify, and explain | The workflow works and the learner can describe its purpose |
| Variation | Hint | Solve the same class of problem in a changed scenario | The learner adapts the workflow rather than copying it |
| Independent | None | Work from a goal and constraints | The result is correct and independently verified |
| Break/fix | Symptoms only | Diagnose a controlled failure | The learner identifies evidence, cause, repair, and retest |
| Transfer | None | Apply the skill in a later project or another tool | The learner selects and applies the skill without prompting |

Suggested spacing is the next session, about one week, and about one month. The
companion changes these intervals according to demonstrated recall and help used.
Mini-labs are stored under [`practice/`](practice/README.md), while larger guided
service labs remain under `azure/practice/`.

## Command-Line Fluency Spine

Azure projects also develop five connected but distinct operational skills.
They are practised inside real builds and through short changed drills rather
than as one long block of disconnected syntax.

| Strand | Core fluency | Project application |
| --- | --- | --- |
| Azure CLI | Discover command groups, use help, manage context, query JSON, select output formats and perform safe Azure administration | Inspect and verify every suitable Azure build, then automate selected changes |
| Bash | Navigate, quote safely, use variables, command substitution, conditions, loops, functions, pipes, redirection and exit status | Compose repeatable Azure CLI workflows and Linux operational checks |
| Linux | Work confidently with paths, files, permissions, processes, packages, environment variables, logs, networking and SSH | Operate Linux hosts and troubleshoot the local/cloud command environment |
| PowerShell | Use objects, the pipeline, properties, filtering, variables, collections, functions, modules, errors and safe change controls | Query and administer Azure with Az modules and build reusable operational scripts |
| Terraform | Read HCL, understand providers and resources, plan safely, manage variables and outputs, inspect state, detect drift, refactor and build reusable modules | Recreate understood Azure designs declaratively and compare desired state with the live environment |

Each skill moves through the same evidence ladder:

```text
read and explain -> predict -> complete a gap -> build from a goal ->
debug a fault -> write a reusable script -> transfer to a later project
```

Copying a working command counts as guided exposure, not fluency. Fluency needs
correct construction, explanation, verification and troubleshooting with little
or no help.

## External Learning Integration

- The learner's projects are the primary learning spine.
- Focused official Microsoft documentation supports safe, current project work.
- Timothy Warner's completed labs provide extra guided repetitions and scenarios.
- Full Microsoft Learn paths and Microsoft Applied Skills follow the projects as consolidation.
- The learner's own projects provide the strongest evidence of applied understanding.
- Practice assessments identify weak areas but do not replace hands-on work.
