# Initial Azure Setup: Repeatable Instructions

## Purpose

Repeat the safe Azure workflow before later projects create chargeable resources:
confirm the target, create a disposable scope, classify it, add cost visibility,
protect it, verify it using more than one tool, and clean it up.

Replace the example names, dates and budget amount with values appropriate to
the new authorised lab.

## Safety Rules

- Use only a personal or otherwise authorised disposable Azure subscription.
- Never publish tenant IDs, subscription IDs, account details or authentication
  codes.
- Confirm the active subscription before using each change tool.
- Check likely cost and regional availability before deploying resources.
- Treat a budget as an alert, not a spending cap.
- Remove a management lock deliberately before cleanup.
- Verify live Azure state independently after portal or Terraform changes.

## Naming and Tags

```text
rg-<workload>-<environment>-<region>-<instance>
```

Example:

```text
rg-azure-foundations-lab-uks-01
```

| Key | Example | Purpose |
| --- | --- | --- |
| `owner` | `Sat` | Identifies responsibility |
| `environment` | `lab` | Marks a disposable learning environment |
| `workload` | `azure-foundations` | Describes the purpose |
| `expiry-date` | `2026-09-21` | Records the intended review or cleanup date |

An expiry tag does not delete anything by itself. A person, query, policy or
automation must act on it.

## 1. Confirm the Azure Scope

In the portal, open **Subscriptions** and confirm the expected directory,
subscription name, Active status and your role.

Why: subscription context controls where resources are created and billed.

Risk: the wrong subscription can create cost or affect unrelated resources.

Evidence: use a tight screenshot or sanitised command output that excludes IDs
and account details.

## 2. Inspect Existing Resources

Open **Resource groups** and **All resources**. Confirm the proposed name is not
already in use and identify anything that must not be changed.

Why: discovery establishes a safe baseline before configuration.

## 3. Create and Tag the Resource Group

From **Resource groups**, select **Create** and use the verified subscription,
**UK South**, a changed name following the standard, and all four tags.

Why: the resource group gives the lab a lifecycle boundary. Tags add ownership
and cleanup metadata.

Evidence: capture the overview or Tags page with all four values visible.

## 4. Configure a Small Budget

At subscription scope, open **Cost Management > Budgets**. Create a small monthly
budget and an email notification threshold.

Why: the budget provides early awareness of unexpected spending.

Important: a threshold notification does not stop resources automatically.

## 5. Apply and Test a Delete Lock

Open the resource group, select **Locks**, and create:

```text
Name: lock-prevent-delete
Type: Delete
```

Add a note explaining the purpose. Confirm the lock is visible, then attempt to
delete only the disposable empty group.

Why: a failed delete proves enforcement. Merely seeing the lock does not.

Expected result: Azure refuses deletion because the group is locked.

Risk: the lock also blocks planned cleanup until deliberately removed.

## 6. Inspect the Activity Log

Open the group's **Activity log** and review the tag, lock and failed delete
operations.

Why: it provides independent control-plane evidence of what Azure accepted or
rejected.

## 7. Verify with Azure CLI

Authenticate if required, confirm the subscription, then run the read-only group
and lock queries in [reference/code-snippets.md](reference/code-snippets.md).

If authentication is stale, sign out and back in, then check the subscription
again before continuing.

Why: command-line verification is repeatable and does not depend on one portal
view.

## 8. Verify with Azure PowerShell

Connect, inspect `Get-AzContext`, and run the read-only group and lock queries.
If browser authentication is unavailable, device authentication may be used.
Never record its temporary code.

Why: Azure PowerShell returns objects that can be filtered and reused in scripts.

## 9. Rebuild a Variation with Terraform

Use a different group name, workload tag and expiry date so Terraform does not
attempt to take over the portal-built object.

From `terraform/`:

1. Inspect the `.tf` files.
2. Confirm the Azure CLI subscription.
3. Set `ARM_SUBSCRIPTION_ID` without printing its value.
4. Run `terraform init`.
5. Run `terraform fmt -check` and `terraform validate`.
6. Save and inspect `terraform plan -out=build11.tfplan`.
7. Apply only the reviewed plan.
8. Verify the live group and lock independently with Azure CLI.

Why: Terraform describes the desired state and its dependencies.

Risk: apply changes live Azure state. Never apply until context and plan are
both checked.

## 10. Controlled Context Break/Fix

Use a new terminal where the temporary `ARM_SUBSCRIPTION_ID` is absent. Do not
deliberately select an unauthorised subscription.

1. Check whether the variable exists without printing it.
2. Observe the missing-context result.
3. Reconfirm the Azure CLI subscription.
4. Restore the variable from the verified context.
5. Repeat the presence check and Terraform plan.

Why: deployment context is a safety control and must be checked before apply.

## 11. Cleanup

Terraform variation:

1. Save and inspect `terraform plan -destroy`.
2. Confirm only the two lab objects will be destroyed.
3. Apply the destroy plan.
4. Confirm the group is absent with `az group exists`.
5. Confirm `terraform state list` is empty.

Portal-built version:

1. Confirm the target is the disposable lab group.
2. Remove `lock-prevent-delete`.
3. Delete the empty group.
4. Confirm absence with `az group exists`.

Local cleanup:

- remove generated plan and state files;
- remove `.terraform/` when the provider cache is no longer needed;
- retain `.tf` source, `.terraform.lock.hcl` and `.gitignore`.

## Final Verification

- Correct tenant and subscription were checked.
- The group followed the naming pattern and had four tags.
- The budget and threshold were configured.
- The lock blocked deletion and the Activity Log recorded the result.
- Azure CLI and PowerShell returned matching live state.
- Terraform planned only the intended objects and was independently verified.
- Both groups and locks were removed.
- No credentials, identifiers, plans or state remain for publication.

## Repetition Path

1. **Variation:** changed group and tags with layered hints only.
2. **Independent:** goal, constraints and verification target without steps.
3. **Break/fix:** diagnose a context, provider or naming failure.
4. **Transfer:** reuse context, cost, tags, locks and cleanup in later builds.
