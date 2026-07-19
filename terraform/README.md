# Terraform Learning Track

This folder is a step-by-step Terraform learning area. Each lesson introduces one
small idea and pairs it with hands-on practice.

## Folder structure

- `docs/` contains lesson notes and concept explanations.
- `practice/` contains short exercises focused on one concept at a time.
- `labs/` contains larger guided exercises that combine several concepts.
- `scripts/` will contain useful automation as the course develops.
- `assets/` stores diagrams and other supporting material.

## How to use this track

1. Read the lesson in `docs/`.
2. Open the matching exercise in `practice/`.
3. Try the exercise using the hints before looking for more help.
4. Run `terraform fmt` and `terraform validate` as you work.
5. Share your attempt for review before moving to the next lesson.

## Learning path

- [Lesson 01: Terraform fundamentals](docs/01-terraform-fundamentals.md)
- Providers and resources
- Variables and outputs
- Terraform state
- Expressions and collections
- Reusable modules
- Remote state and collaboration
- Azure infrastructure project

## Current exercise

Start with [Practice 01: Terraform block structure](practice/README.md). After
that, continue to [Lab 01: Manage a local file](labs/01-local-file/README.md).
Neither exercise requires a cloud account.

## Useful commands

```bash
terraform fmt       # Format Terraform configuration
terraform init      # Download providers and initialise the working directory
terraform validate  # Check whether the configuration is valid
terraform plan      # Preview proposed changes
terraform apply     # Make the planned changes
terraform destroy   # Remove resources managed by this configuration
```

Do not run `apply` or `destroy` unless the current exercise asks you to.
