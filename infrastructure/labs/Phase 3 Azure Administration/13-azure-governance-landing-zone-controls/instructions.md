# Azure Governance and Landing-Zone Controls: Instructions

This file records the workflow actually completed. It will be expanded one
verified stage at a time.

## Current Stage

1. Local project structure created.
2. UK South selected as the primary region.
3. UK West selected as the secondary recovery region.
4. Initial required-tag standard defined with guided help.
5. Active Azure subscription context checked with filtered Azure CLI output.
6. Existing Tenant Root Group to subscription hierarchy inspected.
7. Isolated `rg-governance-lab-uks-01` resource group created in UK South with
   the six required governance tags.
8. Resource-group state and tags independently verified with a public-safe
   Azure CLI YAML query.
9. Relevant Microsoft built-in Policy definitions filtered to location and tag
   controls.
10. The `Allowed locations` definition, parameters, modes and effects inspected.
11. `audit-allowed-locations` assigned at the isolated resource-group scope with
    UK South and UK West parameters and the `Audit` effect.
12. The assignment and its parameters independently verified with filtered YAML
    output.
13. A compliant UK South NSG created and independently verified.
14. An East US NSG created and independently verified, proving that `Audit`
    records rather than blocks a non-compliant write.
15. `Microsoft.PolicyInsights` registration confirmed and a resource-group
    compliance scan completed. Resource-specific latest-state queries proved the
    UK South NSG `Compliant` and the East US NSG `NonCompliant`.
16. The Audit assignment removed and independently proved absent.
17. `deny-allowed-locations` created and independently verified at the same
    isolated scope with UK South and UK West allowed.
18. A fresh East US NSG request returned `RequestDisallowedByPolicy`; a filtered
    list query independently proved the target resource was not created.
19. `Require a tag on resources` was assigned at the isolated scope with the
    `environment` parameter and `DoNotEnforce` evaluation mode.
20. A duplicate portal-generated assignment was identified by its internal
    name and removed without affecting the clearly named assignment.
21. Both untagged NSGs initially evaluated as non-compliant. The UK South NSG
    was given `environment=lab`; a later scan proved it compliant while the
    untagged East US NSG remained non-compliant.
22. Enforcement was changed to `Default`. A new untagged UK South NSG request
    returned `RequestDisallowedByPolicy`, and a filtered list query proved the
    denied resource was never created.
23. A new UK South NSG with `environment=lab` was allowed and independently
    verified as successfully provisioned.
24. A custom `Governance baseline lab` initiative was defined from versioned
    JSON with reusable allowed-location and required-tag parameters.
25. The initiative was assigned in `DoNotEnforce`, verified, moved to `Default`
    enforcement and left active while the two redundant individual assignments
    were removed.
26. With only the initiative assignment retained, an untagged UK South NSG was
    blocked by the required-tag member and a tagged East US NSG was blocked by
    the allowed-locations member.
27. A tagged UK South NSG succeeded and was independently verified, proving the
    initiative permits resources that satisfy both controls.

During assignment, Azure CLI 2.83.0 returned `PolicyDefinitionNotFound` even
though the built-in definition ID was correct. Read-only checks confirmed the
definition could be resolved by its public name. Changing the lookup from the
root-level definition `id` to its `name` allowed the assignment to succeed.

## Next Stage

Azure cleanup is complete. The initiative assignment, disposable resource group
and subscription-level custom initiative definition were removed and verified
absent. Delete-lock and budget repetition were omitted because the previous
foundations project already covered them. Terraform moves to Project 14 as a
changed networking variation. The practical project is complete.
