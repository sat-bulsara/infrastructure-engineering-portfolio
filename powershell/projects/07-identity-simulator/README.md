# Project 07 - Identity Lifecycle Simulator

## Mission

Design safe joiner and leaver automation using local data before connecting it to Active Directory or Microsoft Graph.

## Concepts

Data modelling, idempotency, validation, splatting, `ShouldProcess`, audit logs and lifecycle workflows.

## Tasks

1. Define a users CSV contract: EmployeeId, FirstName, LastName, Department, Manager and Action.
2. Maintain a local JSON file as the simulated directory.
3. Implement Create and Disable actions; duplicate EmployeeId values must not create duplicate users.
4. Generate unique usernames deterministically.
5. Support `-WhatIf` and write an append-only audit record for applied changes.

## Acceptance Checks

- Re-running the same input makes no duplicate changes.
- Invalid actions and missing fields are rejected with row numbers.
- `-WhatIf` leaves the directory and audit file unchanged.
- Every applied change records timestamp, action, target and outcome.
- No real AD, Graph or Microsoft 365 command is used in this project.

## Stretch

Separate the workflow engine from the JSON adapter so a future AD adapter can implement the same interface.
