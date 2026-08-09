# Azure Mini-Lab Bank

This folder holds short repetitions of skills already introduced in a build or
project. A mini-lab normally takes 20 to 45 minutes. It changes the scenario and
reduces help so familiarity becomes independent operational skill.

Larger guided service labs and publishable evidence remain under
`azure/practice/`. These companion mini-labs are smaller drills and may reuse
temporary resources from a current build.

## Repetition Levels

| Level | Name | What the learner receives |
| --- | --- | --- |
| R1 | Guided | Explanation, steps, and verification prompts |
| R2 | Variation | Changed scenario and layered hints |
| R3 | Independent | Goal, constraints, and success criteria only |
| R4 | Break/fix | Symptoms and access to diagnostic evidence |
| R5 | Transfer | A later project, another service, or an automation task |

## File Naming

Use this format:

`b<build>-<skill>-r<level>-<short-name>.md`

Examples:

- `b11-scope-r1-resource-hierarchy.md`
- `b12-rbac-r2-storage-scope.md`
- `b14-nsg-r4-effective-rules.md`
- `b17-bicep-r5-module-transfer.md`

## Planned Early Repetitions

| Skill | R1 | R2 | R3 | R4 | R5 |
| --- | --- | --- | --- | --- | --- |
| Azure hierarchy and context | Identify tenant, subscription, resource group, and resource | Inspect a changed resource scope | Select the correct scope from a scenario | Diagnose the wrong active subscription | Use context checks before an automated deployment |
| Group-based RBAC | Review the existing guided lab | Assign a role at storage scope | Design least-privilege access from a goal | Diagnose wrong scope or missing group membership | Reuse group-based access in a later project |
| Network access | Build and verify an NSG rule | Use an application security group | Design rules from a traffic requirement | Diagnose an effective-rule failure | Reuse the model in private endpoint or hybrid networking work |
| Terraform workflow | Read and apply a small resource | Change inputs without editing resource logic | Build from desired state | Investigate drift or state mismatch | Extract a reusable module for a project |

Only create the next mini-lab when it is due. Avoid filling the folder with long
unused worksheets.

## Completion Rule

Record the result in `../PROGRESS.md`, including the evidence, help used, and next
review date. A successful guided run is not independent fluency. Stop focused
drilling when the learner can explain, perform, verify, and troubleshoot the
skill with little or no help, then retrieve it naturally in later projects.

Use the [mini-lab template](../reference/mini-lab-template.md) when creating a new
drill.
