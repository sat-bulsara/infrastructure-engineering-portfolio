# Learning Record 0010: NextWork Project Pattern Audit

## Date

2026-08-26

## Finding

The public NextWork catalogue uses short AWS project chains for networking,
databases, security, DevOps and three-tier applications. Most service outcomes
already had stronger coverage in the Azure roadmap, and the Guided, Variation
and Independent course progression already provided the same reduction in help.

## Change

Four explicit checkpoints were added without creating duplicate numbered
projects:

- virtual network flow logs and cost-controlled Traffic Analytics in Project 23;
- a Blob Storage and current Front Door static-content variation in Project 24;
- controlled synthetic security signals rather than a publicly vulnerable
  application in Project 29; and
- private package feeds, upstream controls, pinned dependencies and dependency
  auditing in Project 35.

Current Microsoft guidance replaces retired NSG flow-log exercises with VNet
flow logs and keeps Front Door work on Standard or Premium rather than Classic.

## Evidence boundary

This was a curriculum comparison, not evidence that any of these Azure skills
has been demonstrated. Login-only NextWork task content was not accessed or
treated as a technical source.

## Next action

Resume Project 13 by creating the tested Deny assignment at the isolated
resource-group scope.
