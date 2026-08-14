# APL-1008 Companion Curriculum

This companion follows the current Microsoft Learn path and the APL-1008 study
guide. Microsoft teaches the official material and supplies the guided project.
The companion adds retrieval, short drills, evidence checks, safe repetition,
troubleshooting, and an independent timed mock.

## Learning loop

For each phase:

```text
retrieve without notes -> complete the Microsoft module -> guided drill ->
real lab task -> independent verification -> explain -> delayed variation
```

Module completion records exposure. Advancement requires observable lab state,
verification, and an explanation in the learner's own words.

## Phase map

| Phase | Official work | Companion outcome | Evidence | Status |
| --- | --- | --- | --- | --- |
| 0. Baseline | Credential overview and prerequisites | Confirm safe lab, recovery point, and starting capability | Completed readiness diagnostic | Current |
| 1. Domain controllers and topology | Deploy and manage AD DS domain controllers | Deploy a DC, work with FSMO roles, functional levels, sites, subnets, and DC placement | Health and topology report plus explanation | Locked |
| 2. AD DS objects | Create and manage Active Directory objects | Manage users, bulk changes, disabled accounts, passwords, gMSAs, groups, OUs, and deleted objects | Object lifecycle evidence and fresh variation | Locked |
| 3. Group Policy and passwords | Create and configure GPOs in Active Directory | Create, link, configure, scope, order, and verify GPOs; configure domain and fine-grained password policy | GPO report, RSoP, and policy verification | Locked |
| 4. AD DS security | Manage security in Active Directory | Delegate narrowly, use Protected Users safely, configure auditing and user rights, and understand NTLM controls | Delegation, audit, and negative-test evidence | Locked |
| 5. Official guided project | Guided project: Administer AD DS | Complete Microsoft LAB_01 through LAB_05 in sequence | Project completion plus selected verification evidence | Locked |
| 6. Gap and repetition pass | Study-guide supporting modules | Demonstrate every assessed operation without following the original clicks | Completed coverage matrix and delayed recall | Locked |
| 7. Timed assessment | Local 45-minute mock | Complete 15 scenario tasks independently under assessment conditions | Score, evidence, error log, and remediation plan | Locked |

## Phase 1: Domain controllers and topology

| Assessed operation | Learn first | Companion practice | Required evidence |
| --- | --- | --- | --- |
| Deploy a domain controller | DNS, replication, Global Catalog, promotion prerequisites | Readiness report, promotion, and independent health checks | DC inventory, DNS and replication health |
| Transfer an FSMO role | Five roles, forest/domain scope, transfer versus seizure | Predict the correct role and transfer one in the lab | Role-holder output before and after |
| Raise a functional level | Feature compatibility and irreversibility | Inspect current modes and perform only when a safe higher target exists | Before/after mode query and recovery boundary |
| Create a site and subnet | Site purpose, subnet mapping, replication topology | Add a new site and CIDR mapping | Site and subnet inventory |
| Move a DC between sites | Server objects and site membership | Move a disposable DC and verify placement | Server object and replication verification |

## Phase 2: AD DS objects

| Assessed operation | Learn first | Companion practice | Required evidence |
| --- | --- | --- | --- |
| Users and bulk management | Attributes, distinguished names, CSV validation, safe reruns | Create one user, then process a mixed-quality CSV | Success/failure summary and queries |
| Disabled users and password resets | Account state, secure password handling, audit impact | Diagnose and correct fictional support cases | State before/after without exposed password |
| gMSA | KDS root keys, principals allowed to retrieve passwords, service use | Create and test one lab gMSA | Account, retrieval permission, and installation test |
| Groups and privileged membership | Scope, category, nesting, Protected Users limitations | Create groups and reconcile membership | Membership diff and verification |
| OUs and Recycle Bin | Delegation boundary, deletion lifetime, restore scope | Create OU structure and recover a deleted test object | Original location restored and attributes checked |

## Phase 3: Group Policy and password policy

| Assessed operation | Learn first | Companion practice | Required evidence |
| --- | --- | --- | --- |
| Create and link a GPO | GPC, GPT, link scope, user/computer halves | Create a narrow test GPO and link it | GPO and link inventory |
| Configure settings | Administrative templates and supported policy state | Configure one observable setting | Report plus endpoint result |
| Scope and processing order | LSDOU, inheritance, enforcement, security filtering | Predict, apply, and explain a multi-link result | `gpresult` or RSoP and prediction comparison |
| Domain password policy | Domain scope and defaults | Configure and query the domain policy | Independent password-policy query |
| Fine-grained password policy | PSO precedence and group targeting | Apply a stricter PSO to a test group | Resultant PSO for a test user |

## Phase 4: AD DS security

| Assessed operation | Learn first | Companion practice | Required evidence |
| --- | --- | --- | --- |
| Delegate permissions | Least privilege, inheritance, task-based delegation | Delegate one OU task to a support group | Positive and negative test |
| Configure auditing | Advanced Audit Policy and event generation | Audit user-account management in one scope | Policy result and labelled event evidence |
| User rights assignment | Rights versus permissions and deny precedence | Apply one narrow lab restriction | RSoP plus positive/negative logon test |
| Protected Users | Authentication restrictions and compatibility | Add only a disposable account and test | Membership, expected restriction, rollback |
| NTLM controls | Audit before deny and dependency risk | Analyse or stage a restriction in the isolated lab | Baseline, change, negative test, rollback |

## Phase 5: Official guided project

Complete the official labs in order because later labs depend on earlier state:

1. Prepare the Hyper-V environment and two Windows Server VMs.
2. Configure domain-controller operations.
3. Configure user-management operations.
4. Manage password policies and enable AD Recycle Bin.
5. Configure security settings.

The companion does not repeat Microsoft's steps. It asks for predictions,
selected verification, and explanation before moving on.

## Phase 6: Coverage and repetition

Use `reference/assessment-blueprint.md` as the coverage matrix. Repeat every
operation with changed names or values and without the original guided steps.
Do not repeat irreversible changes merely for repetition; use a fresh snapshot
or verify the already-enabled feature and practise its safe use.

## Phase 7: Timed assessment

The final local mock contains 15 grouped tasks and a 45-minute timer, matching
Microsoft's published intermediate-lab duration and typical task-count range.
It is an original practice scenario, not copied assessment content.
