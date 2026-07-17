# Exercise 05 - Multiple conditions

# Scenario:
# Classify a server based on its CPU usage.
#
# 90 or higher = Critical
# 70 or higher = Warning
# Below 70     = Healthy

$cpuUsage = 82

# Comparison operators:
#
# PowerShell  Python / JavaScript  Meaning
# -ge         >=                   Greater than or equal
# -le         <=                   Less than or equal
# -eq         == / ===             Equal

# PowerShell structure:
# if (condition) { }
# elseif (condition) { }
# else { }
#
# Python equivalent:
# if condition:
# elif condition:
# else:
#
# JavaScript equivalent:
# if (condition) { }
# else if (condition) { }
# else { }

# TODO 1:
# Replace FIRST_CONDITION so it checks whether CPU usage is 90 or higher.

# TODO 2:
# Replace SECOND_CONDITION so it checks whether CPU usage is 70 or higher.

# TODO 3:
# Replace each MESSAGE with Critical, Warning or Healthy.

if ($cpuUsage -ge 90) {
    Write-Host "Critical"
}
elseif ($cpuUsage -ge 70) {
    Write-Host "Warning"
}
else {
    Write-Host "Healthy"
}
