# Lesson 01: Terraform Fundamentals

## Terraform in plain language

Terraform lets you describe infrastructure in text files. It compares that
description with what currently exists, then proposes the changes needed to make
the two match.

In Python or JavaScript, you normally write a sequence of instructions:

```text
create a file
write some text
close the file
```

Terraform is declarative. You describe the result instead:

```text
a file named hello.txt should exist with this content
```

Terraform decides which actions are required to reach that result.

## Three building blocks

### Provider

A provider is a plugin that lets Terraform communicate with a service or API.
Examples include Azure, AWS, GitHub, Kubernetes, and the local computer.

Think of a provider like an imported package in Python or JavaScript: it gives
Terraform additional resource types it knows how to manage.

### Resource

A resource is something Terraform manages, such as a virtual network, storage
account, or local file. Resource blocks have this general shape:

```hcl
resource "RESOURCE_TYPE" "LOCAL_NAME" {
  argument = "value"
}
```

`LOCAL_NAME` is Terraform's internal label. It does not automatically become the
real resource's name.

### State

Terraform records what it manages in a state file. State allows Terraform to
compare your configuration with existing resources. Treat state as potentially
sensitive data and do not manually edit it.

## The core workflow

1. `terraform init` prepares the directory and downloads providers.
2. `terraform fmt` formats `.tf` files consistently.
3. `terraform validate` checks configuration structure.
4. `terraform plan` previews changes without making them.
5. `terraform apply` makes the approved changes.

The plan is an important checkpoint. Read it before applying anything.

## Check your understanding

Before starting the lab, answer these in your own words:

1. How is declarative configuration different from a Python script?
2. What job does a provider perform?
3. Why should you inspect a plan before applying it?

Continue with [Practice 01](../practice/README.md), then try
[Lab 01](../labs/01-local-file/README.md).
