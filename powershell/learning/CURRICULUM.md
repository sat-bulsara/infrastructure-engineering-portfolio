# PowerShell Infrastructure Curriculum

## Course phases

| Phase | Real-world outcome | Required knowledge and skills | Evidence | Status |
| --- | --- | --- | --- | --- |
| A: Language and object foundations | Discover commands and turn system data into reusable tools | command discovery, variables, types, collections, objects, pipeline, conditions, loops, functions and validation | Projects 01-04 plus Gate A | Current |
| B: Reliable support automation | Process unreliable data and build reusable diagnostics | files, CSV, JSON, errors, logging, networking, lifecycle data, modules and tests | Projects 05-08 plus Gate B | Planned |
| C: Windows operations | Audit and safely operate Windows clients and servers | CIM, services, scheduled tasks, ACLs, shares, events, updates, configuration and verification | Projects 09-12 plus Gate C | Planned |
| D: Active Directory infrastructure | Automate identity and domain administration safely | AD objects, distinguished names, groups, JML, GPO, DNS, idempotency and audit evidence | Projects 13-16 plus Gate D | Planned |
| E: Azure and Microsoft 365 | Query and govern cloud identities and resources | Az PowerShell, Graph, Exchange Online, RBAC, policy, licensing and safe authentication | Projects 17-20 plus Gate E | Planned |
| F: Production-quality automation | Build maintainable, tested and controlled tooling | secrets, configuration, remoting, parallelism, modules, static analysis, CI and incident recovery | Projects 21-24 plus final gate | Planned |

## Numbered project roadmap

| No. | Project | New coding focus | Required repetition | Status |
| --- | --- | --- | --- | --- |
| 01 | Command Discovery and Environment Report | help, command shape, object inspection, custom object and CSV export | baseline project | Current |
| 02 | System Inventory | pipeline filtering, sorting, selection, calculated properties and parameters | discovery, objects, properties and export | Planned |
| 03 | Health Checker | arrays, loops, conditions, thresholds and exit states | objects, parameters, arithmetic and structured output | Planned |
| 04 | Function Toolkit | advanced functions, validation, pipeline input and `ShouldProcess` | Projects 01-03 refactored into reusable commands | Planned |
| Gate A | Language foundations quiz and mini-tool | cumulative prediction, debugging and coding | Projects 01-04 without notes | Planned |
| 05 | Log Analyser | files, CSV, JSON, timestamps, validation and error handling | functions, loops, objects and export | Planned |
| 06 | Network Diagnostics | DNS, ports, timeouts, batch resilience and diagnostics | parameters, functions, errors and structured results | Planned |
| 07 | Identity Lifecycle Simulator | data modelling, splatting, idempotency, audit logs and mock adapters | files, validation, functions and `WhatIf` | Planned |
| 08 | Enterprise Administration Module v1 | module layout, manifests, public/private functions and introductory Pester | refactor Projects 03-07 with consistent contracts | Planned |
| Gate B | Reliable automation quiz and mini-module | cumulative data, error and module work | Projects 01-08 in a changed support scenario | Planned |
| 09 | Windows Server Baseline and Drift Reporter | CIM queries, expected-versus-observed state and report composition | discovery, pipelines, functions, errors and export | Planned |
| 10 | Service and Scheduled Task Operations | service dependencies, task objects, safe actions and state verification | Windows baseline, loops, `ShouldProcess` and logging | Planned |
| 11 | File, Share and ACL Auditor | filesystem objects, NTFS ACLs, share permissions and effective-access reasoning | objects, functions, validation and reporting | Planned |
| 12 | Event and Update Troubleshooter | event filtering, time windows, update state and evidence correlation | files, errors, pipelines, dates and diagnostics | Planned |
| Gate C | Windows operations quiz and break/fix tool | cumulative Windows evidence and safe automation | Projects 01-12 on a changed client or server | Planned |
| 13 | Active Directory Discovery and Health Reporter | AD module discovery, domain objects, replication and DNS evidence | Windows checks, functions, objects and sanitisation | Planned |
| 14 | OU, User and Group Provisioning | CSV plans, distinguished names, validation, duplicate checks and splatting | identity simulator, files, errors and `WhatIf` | Planned |
| 15 | Joiner, Mover and Leaver Automation | state reconciliation, group changes, disablement, audit and safe reruns | AD provisioning, idempotency, logging and tests | Planned |
| 16 | GPO, DNS and Domain Client Verifier | GPO reports, resolver evidence, secure channel and dependency checks | AD health, networking, events and structured reports | Planned |
| Gate D | AD infrastructure quiz and lifecycle repair | cumulative identity, DNS and policy break/fix | Projects 01-16 in a changed domain scenario | Planned |
| 17 | Azure Resource Inventory | Az module discovery, contexts, subscriptions, resource objects and export | command discovery, functions, errors and sanitisation | Planned |
| 18 | Azure Governance and Access Audit | RBAC, policy, tags, locks and expected-versus-observed controls | Azure inventory, identity logic, reports and safe scope | Planned |
| 19 | Microsoft Graph Identity Reporter | Graph scopes, pagination, users, groups and public-safe reports | API-style objects, errors, functions and configuration | Planned |
| 20 | Microsoft 365 Lifecycle Workflow | licences, mailbox evidence, access reconciliation and mock-first adapters | JML logic, Graph data, idempotency and audit logs | Planned |
| Gate E | Cloud administration quiz and mini-audit | cumulative Azure and Microsoft 365 reasoning | Projects 01-20 in a changed practice tenant scenario | Planned |
| 21 | Secure Configuration and Credential Boundaries | data files, environment variables, secret stores and redaction | validation, modules, errors and least privilege | Planned |
| 22 | Remoting and Controlled Parallel Operations | sessions, serialization, throttling, timeouts and partial failure | networking, functions, logging and safe scope | Planned |
| 23 | Tested Module and Quality Pipeline | Pester tests, mocks, PSScriptAnalyzer, module versioning and CI | refactor and test earlier tools | Planned |
| 24 | Infrastructure Automation Capstone | independent design, adapters, rollback, verification and incident recovery | select and integrate skills from Projects 01-23 | Planned |
| Final | Unseen cumulative assessment | requirements analysis, scripting, debugging, safety and teach-back | independent build plus repair of every missed item | Planned |

## Spiral repetition rule

From Project 03 onward, each project brief must name at least two earlier skills
that will be reused. At least one repeated skill must be completed with less
tutor support than before. Every fourth project ends a phase and is followed by
a cumulative quiz, break/fix task and small independent build.

## Project learning pattern

| Project task | Learn first | Practice | Project evidence |
| --- | --- | --- | --- |
| Discover | Command, module, object type and scope | Read-only command discovery | Exact command and selected object properties |
| Model | Inputs, outputs and state | Mock objects or safe local data | Data contract explained by Sat |
| Build | Minimum new language feature | One guided code change | Executable script with structured output |
| Vary | Reuse with changed data or target | Hint-only mini-task | Adapted code without copied answer |
| Break and fix | Error boundaries and evidence | Controlled syntax, data or environment fault | Error, hypothesis, repair and retest |
| Verify | Independent read-only test | Separate verification command or assertion | Expected and observed state compared |
| Retain | Mental model, code and safety | Six-part quiz and delayed recall | Repaired gaps and later transfer |

## Project 01 learning map

| Project step | Learn first | Practice | Evidence |
| --- | --- | --- | --- |
| Confirm the runtime | Edition, version, host and current user | Query `$PSVersionTable` and environment values | Public-safe runtime summary |
| Discover commands | Verb-noun naming, `Get-Command` and `Get-Help` | Find one command without web search | Discovery path explained |
| Inspect objects | Types, properties, methods and `Get-Member` | Inspect one safe command's output | Relevant properties selected |
| Create structured output | Hashtables and `PSCustomObject` | Build one environment object | Property types explained |
| Export and read back | Pipeline and CSV serialisation | Export then import the object | Read-back values verified |
| Make it reusable | Parameters and comment-based help | Add a narrow output path parameter | Clean-session run and help evidence |
