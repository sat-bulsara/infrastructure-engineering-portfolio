<#
.SYNOPSIS
    TODO: Describe the script.
.EXAMPLE
    TODO: Show how to run it.
#>

[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'

# Discovery: run these interactively and inspect their output.
Get-Command -Noun ComputerInfo
Get-Help Get-ComputerInfo -Examples
$PSVersionTable | Get-Member

# TODO: Create the output directory safely.
# TODO: Build one [PSCustomObject] with the six required properties.
# TODO: Display the object.
# TODO: Export it to output/environment.csv without type information.
