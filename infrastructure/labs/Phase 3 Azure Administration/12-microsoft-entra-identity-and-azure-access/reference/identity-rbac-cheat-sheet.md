# Microsoft Entra Identity and Azure RBAC Cheat Sheet

## The Two Role Systems

| Role system | Controls | Example |
| --- | --- | --- |
| Microsoft Entra roles | Administration of directory objects and identity services | Groups Administrator |
| Azure RBAC roles | Access to Azure resources through Azure Resource Manager | Reader on a resource group |

An Entra role does not automatically grant access to Azure resources. An Azure
role does not automatically make someone an Entra administrator.

## Anatomy of an Azure Role Assignment

Every assignment answers three questions:

1. **Who?** A user, group, service principal or managed identity.
2. **What?** A role definition containing allowed actions.
3. **Where?** A management group, subscription, resource group or resource.

```text
principal + role + scope = role assignment
```

## Scope and Inheritance

```text
Management group
  -> Subscription
      -> Resource group
          -> Resource
```

Permissions assigned at a parent scope are inherited by child scopes. A
resource-group assignment is narrower than a subscription assignment and limits
how many resources are exposed if the principal is compromised.

## Reader in This Lab

Reader was suitable because the requirement was to inspect Azure resources. The
test confirmed that Reader could view the resource group but could not save a
tag change. Reader is not a cost-control role and does not grant access to all
resource data automatically.

## Group-Based Access

```text
User -> group membership -> group role assignment -> Azure access
```

Benefits:

- joiners receive the group's existing access;
- movers can be moved between job-based groups;
- leavers lose inherited access when membership is removed;
- access reviews can focus on group membership and group assignments;
- fewer direct user assignments need to be tracked.

Direct assignments can still exist, so effective access must be checked rather
than inferred from one group alone. Azure RBAC is additive: overlapping allowed
assignments combine unless another Azure control changes the result.

## Assigned and Dynamic Membership

- **Assigned:** an administrator or automation explicitly adds and removes
  members. This was used in the lab.
- **Dynamic:** Entra evaluates a rule based on identity attributes. This needs
  suitable licensing and was outside this lab's scope.

## Joiner, Mover and Leaver Checks

| Event | Change | Verification |
| --- | --- | --- |
| Joiner | Add user to the approved access group | Membership is true and effective access is present |
| Mover | Remove old membership and add the new job-based membership | Old access is absent and new access is correct |
| Leaver | Remove access-group memberships and disable or delete according to policy | Membership and effective access are absent |

## Troubleshooting Order

1. Confirm the correct tenant and subscription.
2. Confirm the principal is the intended user or group.
3. Confirm group membership.
4. Confirm the role definition.
5. Confirm the assignment scope and inherited parent assignments.
6. Start a fresh sign-in session if testing changed access.
7. Retest the exact allowed or denied action.

## Security Reminders

- Prefer the least-privileged role and narrowest useful scope.
- Use group-based access where it supports the lifecycle model.
- Keep daily user and administrative identities separate in real environments.
- Do not publish passwords, tokens, tenant IDs, subscription IDs or object IDs.
- Record and remove short-lived test access.
