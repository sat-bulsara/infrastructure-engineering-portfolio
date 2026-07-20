# PowerShell Practice Workbook
#
# Exercises 1-6 remain in their original files as completed history.
# Complete Exercises 7-10 in this file.
# New exercises will be appended below.

#region Exercise 07 - Hashtables

# A hashtable stores related information as key/value pairs.
#
# PowerShell:
# $user = @{
#     Name = "Sam"
#     Role = "Support"
# }
#
# Python equivalent:
# user = {"Name": "Sam", "Role": "Support"}
#
# JavaScript equivalent:
# const user = { Name: "Sam", Role: "Support" };

# TODO 1:
# Replace the placeholder values so this hashtable describes:
# Name   = WEB01
# Role   = Web Server
# Status = Offline

$server = @{
    Name   = "WEB01"
    Role   = "Web Server"
    Status = "Offline"
}

# Read a value with dot notation: $hashtable.Key

# TODO 2:
# Replace each TODO below with the correct value from $server.

Write-Host "Name: $($server.Name)"
Write-Host "Role: $($server.Role)"
Write-Host "Status before change: $($server.Status)"

# TODO 3:
# Use dot notation and assignment to change the server's Status to Online.
$server.Status = "Online"

# TODO 4:
# Replace TODO with the updated Status value.
Write-Host "Status after change: $($server.Status)"

#endregion Exercise 07

#region Exercise 08 - Objects and properties

# A PSCustomObject represents one structured item with named properties.
# PowerShell commands commonly return objects like this.
#
# PowerShell:
# $user = [PSCustomObject]@{
#     Name = "Sam"
#     Role = "Support"
# }
#
# Python comparison:
# user = {"Name": "Sam", "Role": "Support"}
#
# JavaScript comparison:
# const user = { Name: "Sam", Role: "Support" };

# TODO 1:
# Replace the placeholder values so the object describes:
# Name            = CLIENT01
# OperatingSystem = Windows 11
# MemoryGB        = 16 (store this as a number, not quoted text)
# Managed         = true (use PowerShell's Boolean true value)

$computer = [PSCustomObject]@{
    Name            = "CLIENT01"
    OperatingSystem = "Windows 11"
    MemoryGB        = 16
    Managed         = $true
}

# TODO 2:
# Put the object variable by itself on the next line so PowerShell
# sends the complete structured object to the output stream.
$computer 

# TODO 3:
# Replace each TODO with the correct property from $computer.
Write-Host "Computer $($computer.Name) runs $($computer.OperatingSystem) and has $($computer.MemoryGB) GB of memory."

# TODO 4:
# Change Managed from true to false using dot notation and assignment.
$computer.Managed = $false 

# TODO 5:
# Replace TODO with the updated Managed property.
Write-Host "Managed after change: $($computer.Managed)"

#endregion Exercise 08

#region Exercise 09 - Pipeline filtering and sorting

# The pipeline sends objects from one command to the next using |.
# The special variable $_ represents the current pipeline object.
#
# PowerShell pattern:
# $items | Where-Object { $_.Property -eq "Value" }
#
# Python comparison:
# [item for item in items if item["Property"] == "Value"]
#
# JavaScript comparison:
# items.filter(item => item.Property === "Value")

$serverInventory = @(
    [PSCustomObject]@{ Name = "WEB01"; Status = "Online"; MemoryGB = 8 }
    [PSCustomObject]@{ Name = "APP01"; Status = "Offline"; MemoryGB = 16 }
    [PSCustomObject]@{ Name = "DB01"; Status = "Online"; MemoryGB = 32 }
    [PSCustomObject]@{ Name = "TEST01"; Status = "Offline"; MemoryGB = 4 }
)

# TODO 1:
# Replace TODO so Where-Object keeps only servers whose Status is Online.

$onlineServers = $serverInventory |
Where-Object { $_.Status -eq "Online"; }

# TODO 2:
# Replace TODO with the property used to sort by memory.
# Keep -Descending so the largest value appears first.

$sortedServers = $onlineServers |
Sort-Object -Property MemoryGB -Descending

# TODO 3:
# Replace the two TODOs with the Name and MemoryGB properties.

$report = $sortedServers |
Select-Object -Property Name, MemoryGB

# TODO 4:
# Put the report variable by itself on the next line so the structured
# results are sent to the output stream.
$report

#endregion Exercise 09

#region Exercise 10 - Functions and parameters

# A function groups reusable code behind a command-like name.
# Parameters allow callers to supply different values each time.
#
# PowerShell:
# function Get-Greeting {
#     param([string]$Name)
#     "Hello $Name"
# }
# Get-Greeting -Name "Sam"
#
# Python comparison:
# def get_greeting(name):
#     return f"Hello {name}"
#
# JavaScript comparison:
# function getGreeting(name) {
#     return `Hello ${name}`;
# }

function Get-ServerHealth {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [ValidateRange(0, 100)]
        [int]$CpuPercent
    )

    # TODO 1:
    # Replace FIRST_CONDITION and SECOND_CONDITION.
    # 90 or higher = Critical
    # 70 or higher = Warning
    # Below 70     = Healthy

    if ($CpuPercent -ge 90) {
        $status = "Critical"
    }
    elseif ($CpuPercent -ge 70) {
        $status = "Warning"
    }
    else {
        $status = "Healthy"
    }

    # TODO 2:
    # Replace each TODO with the correct parameter or local variable.
    # Do not use Write-Host: return one structured object.

    [PSCustomObject]@{
        Name       = $name
        CpuPercent = $CpuPercent
        Status     = $status
    }
}

# TODO 3:
# Replace each TODO with a call to Get-ServerHealth using these values:
# WEB01 = 45
# APP01 = 75
# DB01  = 95

$healthReport = @(
    Get-ServerHealth -Name "WEB01" -CpuPercent 45
    Get-ServerHealth -Name "APP01" -CpuPercent 75
    Get-ServerHealth -Name "DB01"  -CpuPercent 95
)

# TODO 4:
# Put $healthReport on a line by itself so the structured results are output.
$healthReport

# TODO 5 - Validation test:
# After the working report has been checked, try calling the function with
# CpuPercent set to 120. Record the validation error, then remove that test. 
#Get-ServerHealth -Name "DB01"  -CpuPercent 120
#endregion Exercise 10
