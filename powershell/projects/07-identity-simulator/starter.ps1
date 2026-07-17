[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory)]
    [string]$InputCsv,

    [string]$DirectoryPath = (Join-Path $PSScriptRoot 'data/directory.json'),

    [string]$AuditPath = (Join-Path $PSScriptRoot 'data/audit.jsonl')
)

$ErrorActionPreference = 'Stop'

# TODO: Load or initialise the simulated directory.
# TODO: Validate every input row before applying any changes.
# TODO: plan idempotent Create/Disable operations.
# TODO: use $PSCmdlet.ShouldProcess before writing changes.
# TODO: save atomically and append audit events.
