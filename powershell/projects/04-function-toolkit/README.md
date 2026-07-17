# Project 04 - Function Toolkit

## Mission

Refactor the health checker into reusable, pipeline-friendly advanced functions.

## Concepts

Functions, parameter sets, validation, pipeline input, begin/process/end, `SupportsShouldProcess` and comment-based help.

## Tasks

1. Implement `Get-DriveHealth` as an advanced function.
2. Implement `Test-ServiceState` accepting service names from the pipeline.
3. Implement `Restart-ServiceSafe` with `SupportsShouldProcess` and `-WhatIf` support.
4. Put the functions in `InfraToolkit.psm1` and export only public functions.
5. Write usage examples in the README.

## Acceptance Checks

- `Get-Command -Module InfraToolkit` shows exactly the intended public commands.
- Each function has synopsis, parameter and example help.
- `Restart-ServiceSafe -WhatIf` makes no change.
- Expected errors become useful error messages; unexpected errors are not hidden.
- Functions return objects that can be piped to `Where-Object` and `Export-Csv`.

## Stretch

Add a module manifest with author, description, version and minimum PowerShell version.
