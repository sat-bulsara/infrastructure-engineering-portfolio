# Phase 1 PowerShell Curriculum

This curriculum is derived from the Phase 1 Windows Infrastructure plan and the local project artifacts. PowerShell is taught immediately before it is needed in a build.

## Course loop

For every build:

1. Recall previously learned syntax.
2. Learn the minimum new PowerShell concept.
3. Complete a small drill against safe or mock data.
4. use the command in the disposable Windows lab.
5. Verify the result with a separate command.
6. Deliberately break a safe component and diagnose it.
7. Explain the result and record the evidence.

## Build map

| Stage | Infrastructure outcome | PowerShell outcome | Completion evidence | Status |
| --- | --- | --- | --- | --- |
| Build 2 — First Windows Server | Configure a usable Windows Server with networking, DNS, updates, remote access, and management | Inspect, configure, verify, and safely restart a Windows server | Repeatable server configuration script plus successful network and service checks | Current |
| Build 3 — Active Directory Domain | Deploy a forest/domain and create the initial directory structure | Install AD DS and manage OUs, users, groups, passwords, and account state | AD build script, CSV-driven user creation, and verification report | Locked |
| Project A — JML Lifecycle | Process a user's join, move, and leaver stages across local AD and the listed cloud services | Design reusable functions, validation, group/licence changes, safe reruns, and audit output | JML automation demonstrated against disposable local and cloud identities | Locked |
| Build 4 — Windows Client | Configure and join a Windows client, then verify authentication | Rename/join a computer, query AD, inspect trust and profiles, and perform account support | Client build script and domain-join troubleshooting record | Locked |
| Phase review | Rebuild and troubleshoot the complete environment | Combine the tools without step-by-step prompting | Clean rebuild, break/fix demonstration, explanation, and published portfolio artifacts | Locked |

`Locked` means “not the current teaching focus,” not “unavailable.” Unlock the next stage when the current stage's evidence is demonstrated.

## Build 2 — First Windows Server

### PowerShell foundations needed

- Discover commands with `Get-Command` and read examples with `Get-Help`.
- Recognise the `Verb-Noun -Parameter Value` command shape.
- Inspect structured output with `Get-Member`, `Select-Object`, and `Format-List`.
- Use variables, pipelines, comparison operators, and simple conditions.
- Distinguish configuration commands from verification commands.
- Use elevated sessions, `-WhatIf` where supported, and a disposable lab.

### Project mapping

| Project task | Learn first | Safe drill | Project evidence |
| --- | --- | --- | --- |
| Inspect server state | Objects, properties, command discovery | Query local computer and OS information and select useful properties | Structured pre-change report |
| Rename the server | Parameters, confirmation, restart requirements | Predict and explain a `Rename-Computer` command before running it | New name verified after restart |
| Configure a static IP | Network adapter objects and parameter binding | Identify the correct adapter and construct the command without executing it | IP, prefix, gateway, and adapter state verified |
| Configure DNS | DNS-client objects and arrays | Read current DNS servers and prepare the replacement values | DNS server addresses and name resolution verified |
| Install Windows features | Feature discovery, filtering, and installation result objects | Find available features and filter by name | Required feature state verified independently |
| Configure remote management | Services, firewall rules, and safety boundaries | Inspect current state before any enablement | Remote management and permitted firewall state verified |
| Restart safely | Remote-session impact and confirmation controls | Explain what state will be lost before restarting | Server returns and post-restart checks pass |
| Diagnose connectivity | `Test-Connection`, `Test-NetConnection`, `Resolve-DnsName`, and network objects | Predict which test isolates IP, gateway, DNS, or port failure | Break/fix record for incorrect IP, DNS, NIC, or firewall state |
| Produce a report | Custom objects, arrays, functions, and export | Return a structured object rather than presentation-only strings | Reusable server verification report |

### Build 2 exit check

- Run the verification commands without notes.
- Explain why internet access and DNS resolution are separate tests.
- Make one safe configuration change and verify it separately.
- Diagnose one deliberately introduced fault.
- Commit the PowerShell work and link it from the build documentation.

## Build 3 — Active Directory Domain

### PowerShell foundations needed

- Functions, named parameters, parameter validation, and structured output.
- Arrays, loops, pipelines, filtering, sorting, and calculated properties.
- Hashtables, splatting, and reusable configuration data.
- CSV import, row validation, and duplicate detection.
- `try`/`catch`, terminating errors, and useful error messages.
- Secure password handling without committing secrets.

### Project mapping

| Project task | Learn first | Practice | Project evidence |
| --- | --- | --- | --- |
| Install AD DS | Windows feature cmdlets and prerequisite checks | Produce a feature readiness report | AD DS installation result and verification |
| Create the forest/domain | AD DS deployment parameters, DNS dependency, and restart behaviour | Validate intended forest/domain settings from mock data | Forest/domain health checks |
| Create OUs | Distinguished names, hierarchy, idempotent checks | Build an OU plan from an array of objects | Repeatable OU creation script |
| Create users | `New-ADUser`, required attributes, secure passwords, and validation | Create users from safe mock records | Valid users created in the intended OUs |
| Bulk import CSV | `Import-Csv`, pipeline objects, validation, and per-row errors | Validate a deliberately flawed CSV | Import summary with successes and failures |
| Create groups and membership | Group scope/category and membership changes | Calculate intended membership from mock data | Group membership verification report |
| Reset/unlock accounts | Account lookup, password reset, unlock, and audit considerations | Diagnose mock account states | Support function with structured outcome |
| Troubleshoot AD/DNS | AD discovery, DNS tests, services, and event evidence | Choose the correct test for each symptom | Break/fix records for DNS, lockout, OU, and membership faults |

## Project A — Joiner, Mover, Leaver lifecycle

Build this in two integrated stages. Complete the local Active Directory lifecycle first, then add the Microsoft 365, Entra ID, Exchange Online, licensing, mailbox, and MFA work required by the source plan. Run cloud automation only in an authorised disposable tenant. If that environment is unavailable, record the cloud stage as blocked rather than treating the project as complete.

### PowerShell foundations needed

- Advanced functions and reusable parameter sets.
- Input validation and clear failure messages.
- Idempotent create/update/disable behaviour.
- Group membership comparison and least-privilege removal.
- Logging, audit records, and summary objects.
- `SupportsShouldProcess`, `-WhatIf`, and confirmation boundaries.
- Tests against mock data before touching the lab directory.
- Module discovery, authentication scopes, and structured results for Microsoft Graph and Exchange Online PowerShell.
- Licence assignment and removal using configuration data rather than hard-coded tenant values.
- Mailbox lifecycle actions and appropriate verification.
- MFA/identity-security implementation based on current official Microsoft guidance.

### Project evidence

- Joiner: create the user, place it correctly, assign approved groups, and prepare the home-folder operation.
- Mover: change department/OU and reconcile group membership.
- Leaver: disable the account, remove access, and record the actions.
- Cloud joiner: create or synchronise the identity, assign the approved licence, create or verify the mailbox, and apply the agreed MFA control.
- Cloud mover: reconcile licences, groups, mailbox access, and identity controls.
- Cloud leaver: remove licences and access, archive or preserve the mailbox as required, and record every action.
- Rerun each operation safely and explain what prevents duplicates or unintended changes.

## Build 4 — Windows Client

### PowerShell foundations needed

- Query local computer, adapter, DNS, profile, and secure-channel state.
- Rename and restart the client safely.
- Join a domain with credentials supplied at runtime, never stored in Git.
- Query AD users and computers.
- Reset a user's password safely in the disposable lab.
- Use `Test-ComputerSecureChannel` and targeted DNS checks.
- Understand when native utilities such as `gpresult` and `nltest` complement PowerShell.

### Project mapping

| Project task | Learn first | Practice | Project evidence |
| --- | --- | --- | --- |
| Prepare networking | Reuse Build 2 network inspection and configuration | Diagnose a wrong-DNS scenario | Client resolves the domain controller |
| Rename and join | Computer identity, credentials, restart, and domain prerequisites | Construct and explain the join sequence | Computer account and successful domain join |
| Verify login/profile | Identity context and local profile inspection | Compare local and domain identity output | Domain login and profile evidence |
| Query AD | AD query filters and selected properties | Find the intended user/computer from mock criteria | Structured AD query output |
| Diagnose trust/login | Secure-channel, DNS, account, and credential tests | Match symptoms to the smallest useful test | Restored trust/login with root-cause record |

## Phase 1 graduation

Demonstrate all of the following without copying a finished solution:

- Rebuild the server, domain, directory structure, and client.
- Explain forests, domains, OUs, users, groups, DNS integration, domain join, and authentication.
- Use PowerShell for core server, AD, and client administration.
- Produce structured verification reports.
- Repair representative networking, DNS, account, authentication, and trust failures.
- Publish scripts and documentation with no credentials or private environment data.
