# Microsoft Entra Identity and Azure Access: Lab Instructions

These instructions record the workflow completed in the lab. Names are
disposable examples. Always confirm the tenant, subscription and target scope
before reproducing the changes.

## Safety and Prerequisites

- Use an authorised non-production Azure tenant and subscription.
- Use a fictional test identity and a dedicated resource group.
- Do not paste passwords, tokens or object identifiers into documentation.
- Confirm that the active account can manage the required Entra objects and
  Azure role assignments.
- Keep the role scope as narrow as the business requirement allows.
- Plan to remove every disposable object at the end.

## Phase 1: Create the Lab Scope

1. Confirm the intended directory and subscription in the portal.
2. Create `rg-identity-access-lab-uks-01` in UK South.
3. Add tags for owner, environment, workload and expiry date.
4. Verify the resource group and tags before configuring access.

This provides a narrow, clearly labelled boundary for the role assignment.

## Phase 2: Create the Identity Model

1. Create a fictional Microsoft Entra user named `azure-lab-reader-01`.
2. Create the security group `sg-azure-resource-readers` with Assigned
   membership.
3. Add the test user as a group member.
4. Refresh the membership page and confirm that the user appears once.

The user should receive Azure permissions through the group, not through a
direct role assignment.

## Phase 3: Assign Least-Privilege Access

1. Open the resource group's **Access control (IAM)** page.
2. Add the built-in **Reader** role.
3. Select **User, group, or service principal**.
4. Choose `sg-azure-resource-readers` as the principal.
5. Review the role, principal and resource-group scope before assigning it.
6. Use **Check access** for the test user and confirm that the group appears in
   the effective assignment.

Reader allows control-plane viewing at this scope but not management changes.

## Phase 4: Test Allowed and Denied Actions

1. Start a separate browser session as the test user.
2. Confirm that the user can open the resource group and view its tags.
3. Attempt to add a harmless temporary tag.
4. Confirm that Azure returns `AuthorizationFailed`.
5. Refresh the page and verify that the tag was not saved.

The failed write is expected. It proves that the assignment is narrower than a
management role.

## Phase 5: Leaver Break/Fix

1. Using the administrator session, remove the test user from the security
   group. Do not delete the user yet.
2. Start a fresh test-user session to avoid relying on stale portal state.
3. Confirm that the resource group can no longer be opened.
4. Resolve the user privately to an object identifier in the shell.
5. Use Azure CLI to check membership and confirm `false`.
6. Restore the membership, then run a separate membership check and confirm
   `true`.
7. Verify the group role assignment with Azure CLI and Azure PowerShell.

This models a leaver and rejoiner workflow while keeping the role assignment
attached to the job-based group.

## Phase 6: Cleanup

Remove objects in dependency order:

1. Remove the Azure Reader role assignment from the security group.
2. Verify that a narrow role-assignment query returns zero results.
3. Remove the test user from the group and verify non-membership.
4. Delete the resource group and verify that it is absent.
5. Delete the security group and verify that it is absent.
6. Delete the fictional test user and verify that it is absent.

Do not interpret a successful delete request as final evidence. Run a new,
read-only query after each important cleanup action.

## Success Criteria

- The user receives Reader through the security group at resource-group scope.
- The user can view the resource group but cannot modify its tags.
- Removing group membership removes the user's inherited access.
- CLI and PowerShell independently identify the intended role assignment.
- All disposable objects are removed and checked after the lab.
