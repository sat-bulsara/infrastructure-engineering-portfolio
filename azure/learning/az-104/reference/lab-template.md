# Azure Learning Lab Template

Use this template for guided practice under `azure/practice/`. Move work to
`azure/projects/` only when the design and implementation have become genuinely
independent.

## Lab Title

State the service and outcome clearly.

## Learning Status

- Guided / Partly guided / Independent
- Roadmap build:
- AZ-104 domain:

## Scenario

What operational or business problem does this lab solve?

## Outcome

What observable result will exist when the lab is complete?

## Prerequisites

- Knowledge needed
- Microsoft Learn module
- Existing lab resources
- Required permissions and licensing

## Security and Cost Plan

- Active tenant and subscription confirmed without recording identifiers
- Least-privilege role and scope
- Network exposure
- Secret-handling method
- Expected cost and smallest suitable SKU
- Cleanup plan
- Evidence to capture before cleanup

## Architecture

Add a diagram when it clarifies identity, traffic, data, or dependencies.

## Learn

- Concept to retrieve
- One focused official source
- Question to answer before building

## Build

Record the meaningful configuration decisions. Avoid turning the README into a
screen-by-screen transcript.

## Verify

List independent, read-only checks and the expected healthy result.

## Controlled Failure

- Fault introduced
- User-visible symptom
- Expected diagnostic boundary

## Troubleshoot

1. Symptom
2. Evidence collected
3. Initial hypothesis
4. Controlled change
5. Independent retest
6. Confirmed root cause, or a clearly labelled likely cause
7. Prevention lesson

## Automate and Extend

Choose only tools that reinforce the lab:

- PowerShell or Azure CLI administration
- Bicep for native Azure infrastructure as code
- Terraform for reusable, stateful infrastructure
- Python for SDK work, inventory, validation, reporting, or operations

## Knowledge Check

- Why was this service selected?
- What scope and identity control access?
- What would change in a production design?
- What costs continue after the lab?
- How would you diagnose the most likely failure?

## Evidence

- Implementation evidence
- Verification evidence
- Break/fix evidence
- Cleanup and final-absence evidence
- Architecture or data-flow diagram
- Public-safe code

Plan these artifacts before the build. Capture the final configuration and
cleanup checks before removing Terraform state or closing the lab session.

## Publication Check

- Embed no more than five screenshots unless a different limit is agreed.
- Use each embedded image to prove a different central result.
- Inspect every image in the folder, not only those linked from the README.
- Crop account details, tenant and subscription IDs, object IDs, device codes,
  browser tabs and unrelated resources.
- Use descriptive numbered kebab-case filenames.
- Remove unsafe raw captures from the public repository.
- Confirm important claims distinguish performed work from retained evidence.
- Validate links, image paths, code formatting, Terraform and Git status.

## Limitations

State what was not implemented, not licensed, not retained as evidence, or not
representative of production.

## Cleanup

Record the resources removed, anything intentionally retained, and final cost
checks.

## Lessons Learned

Explain what changed in the learner's mental model and what should be reviewed
later.
