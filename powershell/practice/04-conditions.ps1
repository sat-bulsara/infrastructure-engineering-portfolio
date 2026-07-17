# Exercise 04 - Conditions with if and else

# Scenario:
# A server has 8 GB of free disk space.
# Display a warning when free space is below 10 GB.
# Otherwise, display a healthy message.

$freeDiskGB = 8
$minimumDiskGB = 10

# PowerShell comparison:
# $number -lt 10
#
# Python equivalent:
# number < 10
#
# JavaScript equivalent:
# number < 10

# TODO 1:
# Replace CONDITION with a comparison that checks whether
# $freeDiskGB is less than $minimumDiskGB.

# TODO 2:
# Replace the two MESSAGE placeholders.
# The if message should warn that disk space is low.
# The else message should say that disk space is healthy.

if ($freeDiskGB -lt $minimumDiskGB) {
    Write-Host "disk space is low"
}
else {
    Write-Host "disk space is healthy."
}
