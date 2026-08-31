# Linux Infrastructure Curriculum

| Phase | Real-world outcome | Required knowledge and skills | Evidence | Status |
| --- | --- | --- | --- | --- |
| A: Shell and filesystem foundations | Identify the lab, navigate it, process text and audit access | terminal, shell, paths, files, streams, pipelines, users, groups, permissions and Bash basics | Projects 01-04 plus Quiz Gate A | Current |
| B: System operations scripting | Inspect processes, services, packages and schedules with reusable code | processes, signals, systemd, APT, timers, variables, conditions, loops and functions | Projects 05-08 plus Quiz Gate B | Planned |
| C: Network, storage and recovery automation | Diagnose connectivity and protect data | addresses, routes, sockets, DNS, filesystems, capacity, archives, checksums and restore testing | Projects 09-12 plus Quiz Gate C | Planned |
| D: Logs and secure administration | Investigate evidence and audit remote exposure | journald, parsing, rotation, SSH, keys, firewall, least privilege and safe configuration | Projects 13-16 plus Quiz Gate D | Planned |
| E: Service and shell engineering | Deploy services and turn scripts into maintainable tools | configuration, rollback, web service operation, Bash libraries, static analysis and script tests | Projects 17-20 plus Quiz Gate E | Planned |
| F: Platform capstone | Automate containers, bootstrap hosts and recover incidents | containers, cloud-init, Python integration, reusable tooling, incident diagnosis and communication | Projects 21-24 plus final cumulative gate | Planned |

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
| Final | Cumulative operations coding assessment | unseen break/fix, scripting, explanation and transfer | independent recovery plus repaired quiz gaps | Planned |

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
