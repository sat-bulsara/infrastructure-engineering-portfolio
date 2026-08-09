# Azure and AZ-104 Curriculum

The detailed checklist is in the [progressive Azure roadmap](../../assets/azure-roadmap.md).

| Stage | Builds | Real-world outcome | Evidence | Status |
| --- | --- | --- | --- | --- |
| A: Platform control | 11-13 | Operate Azure safely and govern identity, access, scope, policy, and cost | Context checks, RBAC tests, policy compliance, budget and landing-zone documentation | Current |
| B: Core infrastructure | 14-16 | Build and repair secure networking, storage, and virtual machines | Diagrams, access tests, recovery tests, break/fix records, automation | Pending |
| C: Deployment and applications | 17-18 | Use native infrastructure as code and operate PaaS and containers | ARM/Bicep changes, App Service and container evidence, Terraform comparison | Pending |
| D: Operations and resilience | 19-21 | Diagnose traffic, monitor resources, alert, back up, and recover workloads | Packet path, KQL, alerts, restores, failover and troubleshooting evidence | Pending |
| E: Integrated environment | 22 | Build and operate a coherent Azure environment with decreasing help | Capstone, Bicep, Terraform, Python operations tool and verbal explanation | Pending |
| F: Numbered portfolio projects | 1-5 | Deepen identity, secrets, Terraform, images, and hybrid networking | Independent, security-first portfolio projects | Pending |
| G: Microsoft consolidation | Official paths and Applied Skills | Connect formal Microsoft material to practical experience and expose gaps | Module checks, Applied Skills and targeted repair drills | Pending |
| H: Certification readiness | Review | Use AZ-104 as an optional confidence and coverage checkpoint | Objective mapping, weak-area repairs and timed practice | Future |

## Build Learning Pattern

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

## External Learning Integration

- The learner's projects are the primary learning spine.
- Focused official Microsoft documentation supports safe, current project work.
- Timothy Warner's completed labs provide extra guided repetitions and scenarios.
- Full Microsoft Learn paths and Microsoft Applied Skills follow the projects as consolidation.
- The learner's own projects provide the strongest evidence of applied understanding.
- Practice assessments identify weak areas but do not replace hands-on work.
