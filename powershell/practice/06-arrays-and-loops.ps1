# Exercise 06 - Arrays and foreach loops

# An array stores multiple values in one variable.

# PowerShell:
# $names = @("Sam", "Alex", "Jo")
#
# Python:
# names = ["Sam", "Alex", "Jo"]
#
# JavaScript:
# const names = ["Sam", "Alex", "Jo"];

# TODO 1:
# Create an array named $servers containing these three server names:
# WEB01, APP01 and DB01
$servers = @("")

# A foreach loop processes each item in an array.
# On each pass, the current item is stored in the singular variable.
#
# PowerShell:
# foreach ($name in $names) { }
#
# Python:
# for name in names:
#
# JavaScript:
# for (const name of names) { }

# TODO 2:
# Replace CURRENT_SERVER with a singular variable named $server.
# Replace SERVER_LIST with the array variable created in TODO 1.

# TODO 3:
# Replace the TODO inside Write-Host with the current server variable.

foreach (CURRENT_SERVER in SERVER_LIST) {
    Write-Host "Checking TODO"
}

# TODO 4:
# Use the array's Count property in place of TODO.
Write-Host "Checked TODO servers."
