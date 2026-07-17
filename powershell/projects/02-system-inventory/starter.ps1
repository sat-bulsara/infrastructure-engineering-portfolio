[CmdletBinding()]
param(
    # TODO: Validate the range 1-100.
    [int]$Top = 10,

    [string]$OutputPath = (Join-Path $PSScriptRoot 'output/processes.csv')
)

$ErrorActionPreference = 'Stop'

# TODO: Create the destination directory.
# TODO: Get processes and sort by WorkingSet64 descending.
# TODO: Select the top results and create calculated CPUSeconds and MemoryMB properties.
# TODO: Export the results and also return them to the pipeline.
