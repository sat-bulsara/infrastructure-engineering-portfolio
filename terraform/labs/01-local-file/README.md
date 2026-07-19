# Lab 01: Manage a Local File

## Goal

Write Terraform configuration that proposes creating `hello.txt` containing:

```text
Hello from Terraform!
```

This exercise uses your computer rather than a cloud account.

## Your task

Complete the TODOs in `main.tf` so that it:

- requires the `hashicorp/local` provider;
- uses a `local_file` resource;
- sets `filename` to `hello.txt`; and
- sets `content` to `Hello from Terraform!`.

Then run these commands from this lab directory:

```bash
terraform fmt
terraform init
terraform validate
terraform plan
```

Stop after `terraform plan`. Read the plan and confirm that it proposes adding
one resource without changing or destroying anything.

## Hints

Try each hint only when you need it.

1. Provider requirements belong inside a `terraform` block.
2. The provider source is a quoted string: `hashicorp/local`.
3. A resource begins with `resource "TYPE" "LABEL"`.
4. The resource type is `local_file`; its arguments are `filename` and `content`.

## When you are finished

Share your completed `main.tf` and the summary from `terraform plan` for review.
Do not run `terraform apply` yet.
