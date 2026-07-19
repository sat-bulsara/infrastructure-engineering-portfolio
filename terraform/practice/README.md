# Terraform Practice

This section contains short exercises for building Terraform fluency. Practice
files intentionally contain TODOs rather than completed solutions.

## Practice 01: Terraform Block Structure

Open `01-block-structure.tf` and complete its three TODOs.

Your configuration should describe a local file with:

- resource type: `local_file`
- Terraform label: `practice`
- filename: `practice.txt`
- content: `I wrote my first Terraform resource.`

This exercise is about recognising HCL block structure. You do not need to run
`terraform init` or `terraform plan` yet.

### Hints

1. A resource declaration has two quoted labels: its type and Terraform name.
2. Arguments inside the block use `name = value` syntax.
3. Text values must be surrounded by quotes.

When you finish, share the file for review before moving to the lab.

## Practice index

- `01-block-structure.tf` — resource blocks and arguments
- Future: variables and types
- Future: references and outputs
- Future: collections and `for_each`
- Future: expressions and conditionals
