# PowerShell Syntax Gym
#
# Complete the TODOs, save the file, then run it with:
#   ./syntax-gym.ps1
#
# The checks report PASS or RETRY. They verify behaviour without providing
# complete solutions. Repeat the set until every drill passes from memory.

function Test-Drill {
    param(
        [Parameter(Mandatory)]
        [string]$Name,

        [Parameter(Mandatory)]
        [bool]$Passed,

        [Parameter(Mandatory)]
        [string]$Hint
    )

    if ($Passed) {
        Write-Host "[PASS]  $Name" -ForegroundColor Green
    }
    else {
        Write-Host "[RETRY] $Name - $Hint" -ForegroundColor Yellow
    }
}

Write-Host "`nPowerShell Syntax Gym - Drill Set 1`n" -ForegroundColor Cyan

#region Quick reference

# Variable:         $name = "value"
# Array:            $items = @("one", "two")
# Equality:         $value -eq "expected"
# At least:         $number -ge 10
# Property:         $object.Property
# Current pipeline: $_.Property
# Filter:           $items | Where-Object { condition }
# Function call:    Get-Thing -Name "value"
#
# Python comparison:
# variable, list, ==, >=, dictionary["key"], list comprehension
#
# JavaScript comparison:
# let/const, array, ===, >=, object.property, array.filter(...)

#endregion Quick reference

#region Drill 01 - Variable

# TODO: Store CLIENT01 in $serverName.
$serverName = $null

Test-Drill -Name "01 Variable assignment" -Passed ($serverName -eq "CLIENT01") -Hint 'Store the required text in $serverName.'

#endregion Drill 01

#region Drill 02 - Arithmetic

$memoryModuleA = 8
$memoryModuleB = 16

# TODO: Calculate the combined memory using the two variables.
$totalMemoryGB = $null

Test-Drill -Name "02 Numeric calculation" -Passed (($totalMemoryGB -eq 24) -and ($totalMemoryGB -is [int])) -Hint 'Add the variables and preserve a numeric result.'

#endregion Drill 02

#region Drill 03 - Comparison

$serviceStatus = "Online"

# TODO: Store the result of comparing serviceStatus with Online.
$isOnline = $null

Test-Drill -Name "03 Equality comparison" -Passed (($isOnline -eq $true) -and ($isOnline -is [bool])) -Hint 'Use PowerShell equality to produce a Boolean.'

#endregion Drill 03

#region Drill 04 - Condition

$cpuPercent = 82
$cpuState = $null

# TODO: Set cpuState using these rules:
# 90 or higher = Critical
# 70 or higher = Warning
# Below 70     = Healthy


Test-Drill -Name "04 Conditional state" -Passed ($cpuState -eq "Warning") -Hint 'Use if, elseif and else with inclusive thresholds.'

#endregion Drill 04

#region Drill 05 - Array

# TODO: Store WEB01, APP01 and DB01 in an array.
$servers = @()

$arrayPassed =
    ($servers.Count -eq 3) -and
    ($servers[0] -eq "WEB01") -and
    ($servers[1] -eq "APP01") -and
    ($servers[2] -eq "DB01")

Test-Drill -Name "05 Ordered array" -Passed $arrayPassed -Hint 'Create a three-item array in the requested order.'

#endregion Drill 05

#region Drill 06 - Loop behaviour

$loopResults = [System.Collections.Generic.List[string]]::new()

# TODO: Loop through $servers and add each name to $loopResults.
# Use the list's Add method inside the loop.


$loopPassed =
    ($loopResults.Count -eq 3) -and
    ($loopResults[0] -eq "WEB01") -and
    ($loopResults[2] -eq "DB01")

Test-Drill -Name "06 Foreach loop" -Passed $loopPassed -Hint 'Process each server and call loopResults.Add(...).'

#endregion Drill 06

#region Drill 07 - Hashtable

# TODO: Create a hashtable with Name = DB01 and Status = Offline.
$serverRecord = @{}

# TODO: Change its Status to Online using dot notation.


$hashtablePassed =
    ($serverRecord.Name -eq "DB01") -and
    ($serverRecord.Status -eq "Online")

Test-Drill -Name "07 Hashtable properties" -Passed $hashtablePassed -Hint 'Create both keys, then update Status through dot notation.'

#endregion Drill 07

#region Drill 08 - Structured object

# TODO: Create a PSCustomObject with Name = WEB01 and MemoryGB = 16.
$computerRecord = $null

$objectPassed =
    ($computerRecord -is [PSCustomObject]) -and
    ($computerRecord.Name -eq "WEB01") -and
    ($computerRecord.MemoryGB -eq 16) -and
    ($computerRecord.MemoryGB -is [int])

Test-Drill -Name "08 PSCustomObject" -Passed $objectPassed -Hint 'Create a structured object and keep MemoryGB numeric.'

#endregion Drill 08

#region Drill 09 - Pipeline

$inventory = @(
    [PSCustomObject]@{ Name = "WEB01"; Status = "Online";  MemoryGB = 8 }
    [PSCustomObject]@{ Name = "APP01"; Status = "Offline"; MemoryGB = 16 }
    [PSCustomObject]@{ Name = "DB01";  Status = "Online";  MemoryGB = 32 }
)

# TODO: Use the pipeline to keep Online servers and sort by MemoryGB
# descending. Store the results in $pipelineResults.
$pipelineResults = @()

$pipelinePassed =
    ($pipelineResults.Count -eq 2) -and
    ($pipelineResults[0].Name -eq "DB01") -and
    ($pipelineResults[1].Name -eq "WEB01")

Test-Drill -Name "09 Filter and sort pipeline" -Passed $pipelinePassed -Hint 'Filter with Where-Object, then pipe into Sort-Object.'

#endregion Drill 09

#region Drill 10 - Function

function Get-ServerLabel {
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    # TODO: Return text in the form Server: NAME using the parameter.
    return $null
}

$label = Get-ServerLabel -Name "APP01"

Test-Drill -Name "10 Function parameter and return" -Passed ($label -eq "Server: APP01") -Hint 'Interpolate the Name parameter into the required text.'

#endregion Drill 10

$completed = @(
    $serverName -eq "CLIENT01"
    ($totalMemoryGB -eq 24) -and ($totalMemoryGB -is [int])
    ($isOnline -eq $true) -and ($isOnline -is [bool])
    $cpuState -eq "Warning"
    $arrayPassed
    $loopPassed
    $hashtablePassed
    $objectPassed
    $pipelinePassed
    $label -eq "Server: APP01"
) | Where-Object { $_ -eq $true }

Write-Host "`nScore: $($completed.Count)/10`n" -ForegroundColor Cyan
