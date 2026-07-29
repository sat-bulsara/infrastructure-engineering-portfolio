# Build 2 - Lesson 0001
# Discover before you change
#
# Goal:
# Use PowerShell's discovery commands to inspect a command and an object
# before making any Windows Server configuration changes.
#
# Safety:
# The main exercise is read-only and works in PowerShell 7 on macOS or Windows.
#
# Workflow:
# 1. Replace one TODO.
# 2. Save the file.
# 3. Run the entire script.
# 4. Fix the first error before moving to the next TODO.

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Write-Host "`nStep 1 - Discover a command" -ForegroundColor Cyan

# TODO 1:
# Use Get-Command with its Name parameter to find Get-ChildItem.
# Store the returned command object in $commandInfo.
$commandInfo = TODO

# Output the structured command object.
$commandInfo

Write-Host "`nStep 2 - Read examples" -ForegroundColor Cyan

# TODO 2:
# Use Get-Help to display examples for Get-ChildItem.
TODO

Write-Host "`nStep 3 - Inspect an object" -ForegroundColor Cyan

# This returns an object representing the current directory.
$currentLocation = Get-Item -Path .

# TODO 3:
# Pipe $currentLocation to the command that reveals its properties and methods.
$currentLocation | TODO

Write-Host "`nStep 4 - Select useful properties" -ForegroundColor Cyan

# TODO 4:
# Pipe $currentLocation to Select-Object.
# Select these properties: Name, FullName, LastWriteTime.
$locationSummary = TODO

$locationSummary

Write-Host "`nStep 5 - Build a small inspection report" -ForegroundColor Cyan

# TODO 5:
# Replace each TODO with the requested value:
# ComputerName      -> the MachineName property from [Environment]
# PowerShellVersion -> the PSVersion value inside $PSVersionTable
# CommandName       -> the Name property from $commandInfo
# CurrentDirectory  -> the FullName property from $locationSummary
$inspectionReport = [PSCustomObject]@{
    ComputerName      = TODO
    PowerShellVersion = TODO
    CommandName       = TODO
    CurrentDirectory  = TODO
}

# Leave the object by itself so PowerShell sends structured output.
$inspectionReport

# Optional Windows Server stretch:
# When you are working on SRV01, use the same discovery loop for
# Get-NetIPConfiguration:
#   1. Confirm that the command exists.
#   2. Read its examples.
#   3. Run it and pipe one result to Get-Member.
#   4. Select only the properties useful for verifying Build 2 networking.
# Do not change the network configuration in this lesson.

