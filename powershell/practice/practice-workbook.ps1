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
    Name            = "TODO"
    OperatingSystem = "TODO"
    MemoryGB        = 0
    Managed         = $false
}

# TODO 2:
# Put the object variable by itself on the next line so PowerShell
# sends the complete structured object to the output stream.


# TODO 3:
# Replace each TODO with the correct property from $computer.
Write-Host "Computer TODO runs TODO and has TODO GB of memory."

# TODO 4:
# Change Managed from true to false using dot notation and assignment.


# TODO 5:
# Replace TODO with the updated Managed property.
Write-Host "Managed after change: TODO"

#endregion Exercise 08

# Exercises 09-10 will be added here as you progress.
