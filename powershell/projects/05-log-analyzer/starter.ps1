[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$Path,

    [string]$OutputDirectory = (Join-Path $PSScriptRoot 'output')
)

$ErrorActionPreference = 'Stop'
$validRecords = [System.Collections.Generic.List[object]]::new()
$rejectedRecords = [System.Collections.Generic.List[object]]::new()

# TODO: Validate Path and create OutputDirectory.
# TODO: Import rows and validate each one inside try/catch.
# TODO: Add good and rejected records to the correct lists.
# TODO: Build and export the summary.
# TODO: Return one final result object.
