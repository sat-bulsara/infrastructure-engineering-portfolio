# Linux Infrastructure Curriculum

## Lab sizing and complexity ladder

Early learning uses short terminal micro-labs before wider projects. Each new
concept moves through this sequence:

1. Explain one piece of syntax and what Bash does with it.
2. Demonstrate one minimal example.
3. Run and inspect one learner example.
4. Change one element without copying the original command.
5. Combine it with one previously understood concept.
6. Use the combination in a small script or operational scenario.

A wider lab should contain several small checkpoints, not one large block of
commands. Difficulty increases only from demonstrated understanding. Successful
copying records guided exposure, not mastery.

| Phase | Real-world outcome | Required knowledge and skills | Evidence | Status |
| --- | --- | --- | --- | --- |
| A: Shell and filesystem foundations | Identify the lab, navigate it, process text and audit access | terminal, shell, paths, files, streams, pipelines, users, groups, permissions and Bash basics | Projects 01-04 plus Quiz Gate A | Current |
| B: System operations scripting | Inspect processes, services, packages and schedules with reusable code | processes, signals, systemd, APT, timers, variables, conditions, loops and functions | Projects 05-08 plus Quiz Gate B | Planned |
| C: Network, storage and recovery automation | Diagnose connectivity and protect data | addresses, routes, sockets, DNS, filesystems, capacity, archives, checksums and restore testing | Projects 09-12 plus Quiz Gate C | Planned |
| D: Logs and secure administration | Investigate evidence and audit remote exposure | journald, parsing, rotation, SSH, keys, firewall, least privilege and safe configuration | Projects 13-16 plus Quiz Gate D | Planned |
| E: Service and shell engineering | Deploy services and turn scripts into maintainable tools | configuration, rollback, web service operation, Bash libraries, static analysis and script tests | Projects 17-20 plus Quiz Gate E | Planned |
| F: Platform capstone | Automate containers, bootstrap hosts and recover incidents | containers, cloud-init, Python integration, reusable tooling, incident diagnosis and communication | Projects 21-24 plus final cumulative gate | Planned |
| G: Configuration management | Configure several Linux hosts consistently and detect drift | Ansible, inventories, playbooks, roles, variables, templates, handlers, idempotence and secrets boundaries | Projects 25-28 plus Quiz Gate G | Planned extension |
| H: Cloud Linux operations | Provision and operate disposable Linux services in an authorised cloud sandbox | cloud identity, networks, compute, cloud-init, infrastructure as code, patching, backup and recovery | Projects 29-32 plus Quiz Gate H | Planned extension |
| I: Observability and reliability | Detect degradation, investigate evidence and improve service reliability | metrics, logs, dashboards, alerts, service-level thinking, capacity, runbooks and incident review | Projects 33-36 plus Quiz Gate I | Planned extension |
| J: Containers and delivery | Build, test and deliver a small multi-service system safely | images, registries, Compose, networks, volumes, CI checks, deployment validation and rollback | Projects 37-40 plus Quiz Gate J | Planned extension |
| K: Advanced Linux engineering | Diagnose unfamiliar host, boot, performance, network and security failures | boot process, kernel interfaces, performance tools, advanced networking, hardening and integrated recovery | Projects 41-44 plus final advanced gate | Planned extension |

## Numbered Project Roadmap

| No. | Project | New coding focus | Required repetition | Status |
| --- | --- | --- | --- | --- |
| 01 | Safe Linux Lab and Baseline Script | first Bash file, shebang, comments, variables and read-only commands | baseline project | Current |
| 02 | Filesystem Operations Workbench | arguments, quoting, paths and safe file actions | host context, variables, output and help | Planned |
| 03 | Text Pipeline Reporter | standard streams, pipes, redirection, `grep`, `sort`, `uniq`, `cut` and introductory `awk` | paths, files, quoting and exit status | Planned |
| 04 | Users, Groups and Permissions Auditor | conditions, functions and permission-report logic | pipelines, variables, paths and public-safe output | Planned |
| Gate A | Shell foundations quiz and mini-script | cumulative prediction, debugging and Bash coding | Projects 01-04 without notes | Planned |
| 05 | Process Inspector Script | process data, loops, numeric comparisons and signals as concepts | functions, pipelines, conditions and exit codes | Planned |
| 06 | Service Health Checker | systemd state, command substitution and reusable checks | processes, functions, conditions, logging output and errors | Planned |
| 07 | Package and Patch Audit Reporter | package queries, arrays and report sections | services, loops, functions, redirection and verification | Planned |
| 08 | Scheduled Maintenance Reporter | script entry points, timestamps, timers or cron and idempotent reporting | package data, functions, paths, logs and exit codes | Planned |
| Gate B | System operations quiz and mini-script | cumulative service, process and scheduling debugging | Projects 01-08 in a changed service scenario | Planned |
| 09 | Network Baseline Script | interface, route, socket and reachability collection | functions, pipelines, conditions, timestamps and sanitisation | Planned |
| 10 | DNS Diagnostic Toolkit | resolver evidence, name queries, arguments and layered tests | network baseline, functions, errors, logging and exit codes | Planned |
| 11 | Storage Capacity Monitor | filesystems, thresholds, arithmetic and warning states | arguments, loops, conditions, functions and reports | Planned |
| 12 | Backup and Restore Verifier | archives, checksums, manifests and restore validation | filesystem safety, storage checks, functions and clear failures | Planned |
| Gate C | Network and recovery quiz and mini-script | cumulative diagnosis, data protection and Bash coding | Projects 01-12 with a changed host state | Planned |
| 13 | Journal Investigation Parser | journald, time windows, filters and evidence summaries | text pipelines, arguments, dates, functions and sanitisation | Planned |
| 14 | Log Rotation and Alert Script | file age, size, rotation concepts and controlled notifications | storage thresholds, loops, conditions, logs and exit codes | Planned |
| 15 | SSH Access Audit Script | keys, permissions, configuration checks and session evidence | users, permissions, services, logs and safe output | Planned |
| 16 | Firewall Exposure Verifier | UFW state, expected-versus-observed rules and port checks | networking, services, conditions, functions and reporting | Planned |
| Gate D | Security and evidence quiz and mini-script | cumulative logs, SSH and firewall break/fix | Projects 01-16 with changed access requirements | Planned |
| 17 | Configuration Deployment Helper | backups, templates, validation, atomic replacement and rollback | files, permissions, services, arguments and errors | Planned |
| 18 | Web Service Operations Toolkit | installation checks, configuration, health, logs and recovery | deployment helper, networking, systemd and verification | Planned |
| 19 | Reusable Bash Operations Library | sourcing, function contracts, return codes and shared helpers | refactor code from Projects 05-18 | Planned |
| 20 | Shell Quality and Test Gate | ShellCheck concepts, fixtures, assertions and script test cases | library design, errors, safe temp data and all earlier Bash skills | Planned |
| Gate E | Shell engineering quiz and mini-build | cumulative refactoring, testing and service recovery | Projects 01-20 without copied scripts | Planned |
| 21 | Container Operations Wrapper | container lifecycle, arguments, status checks and logs | services, networking, storage, functions and safety controls | Planned |
| 22 | Cloud-Init Bootstrap Project | YAML structure, embedded Bash, idempotence and first-boot evidence | packages, users, services, files and logging | Planned |
| 23 | Python-Enhanced Linux Reporter | choose Bash or Python for parsing and structured output | Linux evidence, Bash orchestration and Python integration | Planned |
| 24 | Linux Incident Automation Capstone | independent toolkit selection, diagnosis, recovery and reporting | select and integrate skills from Projects 01-23 | Planned |
| Core Final | Cumulative operations coding assessment | unseen break/fix, scripting, explanation and transfer | independent recovery plus repaired quiz gaps from Projects 01-24 | Planned |
| 25 | Ansible Inventory and Discovery Lab | inventories, facts, check mode and safe remote discovery | SSH, host context, arguments, reports and public-safe evidence | Planned extension |
| 26 | Idempotent Host Configuration | playbooks, modules, variables and state declarations | packages, users, permissions, services and verification | Planned extension |
| 27 | Roles, Templates and Handlers | role structure, Jinja templates, handlers and validation | configuration deployment, functions, service health and rollback | Planned extension |
| 28 | Configuration Drift and Recovery | drift detection, controlled correction and multi-host reporting | logs, checksums, idempotence, testing and incident evidence | Planned extension |
| Gate G | Configuration management quiz and practical | unseen multi-host requirement, drift fault and repair | Projects 01-28 without copied playbooks | Planned extension |
| 29 | Authorised Cloud Linux Baseline | cloud identity boundaries, network scope and reproducible discovery | cloud-init, SSH, firewall, Bash reporting and sanitisation | Planned extension |
| 30 | Infrastructure as Code Deployment | declarative compute, network and storage resources with plan review | configuration management, variables, validation and rollback | Planned extension |
| 31 | Cloud Service Operations Lab | deploy, patch, monitor and back up a small Linux service | systemd, networking, storage, logs and health checks | Planned extension |
| 32 | Cloud Failure and Recovery Exercise | replace or recover a degraded disposable host from code and evidence | backups, DNS, automation, incident reasoning and retesting | Planned extension |
| Gate H | Cloud operations quiz and practical | unseen deployment change plus controlled recovery | Projects 01-32 with least-privilege decisions | Planned extension |
| 33 | Metrics and Capacity Baseline | collect useful host and service metrics with threshold logic | processes, storage, networking, Python parsing and reports | Planned extension |
| 34 | Log and Metric Correlation Lab | align timestamps and correlate symptoms across evidence sources | journald, pipelines, structured data and hypotheses | Planned extension |
| 35 | Alert and Runbook Engineering | actionable alerts, safe checks and tested operator instructions | conditions, exit codes, service checks and communication | Planned extension |
| 36 | Reliability Incident Review | controlled outage, timeline, recovery and prevention work | monitoring, rollback, automation and root-cause reasoning | Planned extension |
| Gate I | Observability and reliability quiz | unseen degradation, noisy evidence and practical recovery | Projects 01-36 with a changed service | Planned extension |
| 37 | Secure Container Image Build | Dockerfile or equivalent, dependencies, users and image inspection | packages, permissions, shell tests and security checks | Planned extension |
| 38 | Multi-Service Compose Lab | service networks, volumes, dependencies and health checks | DNS, ports, storage, configuration and logs | Planned extension |
| 39 | Continuous Integration Checks | automated linting, tests, image checks and evidence capture | Bash quality, Python tests, exit codes and Git workflows | Planned extension |
| 40 | Safe Delivery and Rollback | versioned deployment, validation, controlled failure and recovery | CI evidence, monitoring, backups and runbooks | Planned extension |
| Gate J | Containers and delivery quiz | unseen build bug, service fault and deployment repair | Projects 01-40 without copied pipeline code | Planned extension |
| 41 | Boot and Recovery Investigation | boot targets, kernel command line, initramfs concepts and rescue evidence | storage, systemd, logs, snapshots and rollback | Planned extension |
| 42 | Linux Performance Investigation | CPU, memory, I/O and process evidence with measured hypotheses | metrics, scripts, pipelines and controlled load | Planned extension |
| 43 | Advanced Network Fault Lab | namespaces or isolated hosts, routes, packet paths and service exposure | DNS, sockets, firewall, logging and diagrams | Planned extension |
| 44 | Advanced Linux Engineering Capstone | unfamiliar multi-layer failure, independent recovery and technical report | select and integrate skills from Projects 01-43 | Planned extension |
| Advanced Final | Senior-foundation practical assessment | unseen system, coding task, break/fix, security decision and transfer | independent evidence plus repair of every missed gap | Planned extension |

## Portfolio Lab Roadmap

Each phase produces a retained practical lab under `../projects/`. Portfolio
evidence must show what Sat actually understood and operated. It must not expose
credentials, keys, public IP addresses, usernames or identifying host details.

| Phase | Portfolio lab | Evidence to retain |
| --- | --- | --- |
| A | Linux baseline and permissions audit | sanitised baseline script, access model, verification and Project 04 audit |
| B | Automated Linux operations toolkit | process, service, patch and schedule reports with a controlled service fault |
| C | Network diagnosis and tested recovery | network evidence, capacity monitor, backup manifest and proved restore |
| D | Secure access and investigation lab | journal investigation, SSH audit, firewall verification and repaired access fault |
| E | Operated web service and shell toolkit | safe configuration deployment, service checks, reusable Bash library and tests |
| F | Automated host bootstrap and incident capstone | cloud-init build, container operations, justified Python integration and incident report |
| G | Multi-host configuration management | inventory, reusable roles, idempotence proof, drift injection and recovery |
| H | Disposable cloud Linux service | infrastructure code, identity and network decisions, operations evidence and rebuild test |
| I | Observable service reliability lab | dashboard, actionable alert, runbook, controlled outage and incident review |
| J | Tested container delivery pipeline | secure image, multi-service deployment, automated checks and rollback evidence |
| K | Advanced Linux recovery capstone | boot, performance or network investigation with independent diagnosis and recovery |

Every portfolio lab should include the operational problem, architecture and
scope, starting-state discovery, code, predicted effects, privilege boundaries,
verification, a controlled fault, recovery, security considerations,
limitations and lessons learned. Screenshots and terminal output must be narrow,
sanitised and supported by Sat's explanation.

Phases G-K are planned extensions. Their exact tools and scenarios should be
reviewed at the end of each preceding phase against Sat's evidence, interests
and target roles. The core Projects 01-24 remain the first major milestone.

## Spiral Repetition Rule

From Project 03 onward, every brief must name at least two earlier skills that
will be reused. At least one repeated skill must be completed with less tutor
support than it received previously. Every fourth project ends a phase and is
followed by a cumulative quiz and mini-script.

## Project Learning Pattern

| Project task | Learn first | Practice | Project evidence |
| --- | --- | --- | --- |
| Establish context | Host, distribution, user, directory and scope | Read-only discovery | Sanitised baseline output |
| Understand healthy state | Component purpose and dependencies | Inspect before changing | Expected state explained by Sat |
| Make one change | Target, privilege and rollback | Guided command with prediction | Changed state plus read-only verification |
| Diagnose it | Symptom boundaries and evidence sources | Controlled fault after health is known | Symptom, evidence, hypothesis, repair and retest |
| Automate it | Shell concept required by repeated work | Small Bash drill | Safe script with useful exit status |
| Retain it | Mental model and trade-offs | Changed scenario and delayed recall | Independent operation or teach-back |

## Fluency Cycle

| Pass | Tutor support | Learner challenge | Move forward when |
| --- | --- | --- | --- |
| Guided | Full or Partial | Predict, run, verify and explain | The action is safe and its purpose is clear |
| Variation | Hint | Change the user, path, service or requirement | Sat adapts rather than copies |
| Independent | None | Work from an operational goal | The correct state is independently verified |
| Break/fix | Symptoms only | Form a hypothesis and recover | Evidence supports the cause, repair and retest |
| Transfer | None | Reuse the skill in a later project | Sat selects the right evidence and command unaided |

Important skills should be revisited near the next session, after roughly one
week and after roughly one month, adjusted from demonstrated recall.

## Project 01 Learning Map

| Project step | Learn first | Practice | Evidence |
| --- | --- | --- | --- |
| Confirm the platform | Linux distribution and release data | Read `/etc/os-release` | Exact public-safe output and explanation |
| Confirm identity | User, UID, groups and privilege boundary | `whoami`, `id` and prediction | Sat distinguishes user from root |
| Confirm location | Working directory, home and root filesystem | `pwd` and path comparison | Correct path mental model |
| Inspect the host | Kernel, hostname handling, CPU, memory and storage | Read-only discovery commands | Sanitised baseline report |
| Discover help | `--help`, `man` and command syntax | Answer one question using local docs | Command and source explained |
| Record safely | Redirection and public-safe evidence | Save a narrow baseline in the project | Reviewed evidence with no identifiers |
