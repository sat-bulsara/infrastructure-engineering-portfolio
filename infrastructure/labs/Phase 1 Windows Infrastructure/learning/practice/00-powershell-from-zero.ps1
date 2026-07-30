# PowerShell From Zero - Quick Drill Workbook
#
# HOW THIS WORKS
# 1. Read only the current exercise.
# 2. Change the code under YOUR TASK.
# 3. Save the file and run it.
# 4. Tell Codex: check
# 5. Codex reviews it and adds the next short exercise here.
#
# We will start with full explanations.
# As you become more confident, the explanations and hints will reduce.

#region Exercise 1 - A command and a text value

# A command tells PowerShell to do something.
#
# Write-Output is a command. It sends a value to PowerShell's output.
# "Hello" is a text value, also called a string.
# Quotation marks tell PowerShell where the text begins and ends.
#
# Python:
# print("Hello")
#
# JavaScript:
# console.log("Hello")
#
# PowerShell:
Write-Output "Hello"

# YOUR TASK:
# Replace the word TODO with your first name.
# Keep the quotation marks.
Write-Output "Sat"

# Expected shape:
# Write-Output "some text"
#
# Do not add Exercise 2 yet. Tell Codex "check" when this is done.

#endregion Exercise 1

#region Exercise 2 - Store your server name

# PROJECT CONNECTION:
# Your current Windows Server project uses the server name SRV01.
# A script needs a way to remember values such as a server name, IP address,
# gateway, or DNS server. PowerShell stores a value in a variable.
#
# A variable is a named storage place.
# PowerShell variable names begin with a dollar sign: $
#
# The equals sign means:
# store the value on the right inside the variable on the left.
#
# Python:
# server_name = "SRV01"
#
# JavaScript:
# const serverName = "SRV01"
#
# PowerShell shape:
# $variableName = "some text"

# YOUR TASK - make two changes:
#
# 1. Replace the text TODO with the real name of your Windows Server.
#    Keep the quotation marks.
#
# 2. Replace the second TODO with the variable that stores the server name.
#    Use the dollar sign and do not use quotation marks.

$serverName = "SRV01"
Write-Output $serverName

# Expected output:
# SRV01
#
# This does not rename or connect to the real server.
# It only practises storing the intended server name in a safe local script.
#
# Do not add Exercise 3 yet. Tell Codex "check" when this is done.

#endregion Exercise 2

#region Exercise 3 - Put variable values inside text

# PROJECT CONNECTION:
# Your Build 2 server uses:
# Server name: SRV01
# IP address: 192.168.1.250
#
# A configuration script often needs to produce a readable message containing
# values stored in variables.
#
# NEW IDEA:
# PowerShell replaces a variable inside a double-quoted string with its value.
# This is called variable substitution or string interpolation.
#
# Example:
$exampleServer = "LAB01"
Write-Output "Preparing $exampleServer"
#
# Output:
# Preparing LAB01
#
# Python comparison:
# print(f"Preparing {example_server}")
#
# JavaScript comparison:
# console.log(`Preparing ${exampleServer}`)
#
# RESEARCH:
# Read the "Double-quoted strings" section:
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_quoting_rules?view=powershell-7.6

# YOUR TASK - make two changes:
#
# 1. Store your real Build 2 IP address in $ipAddress.
#    Replace TODO but keep the quotation marks.
#
# 2. Inside Write-Output, replace TODO with the variable that stores the
#    IP address. Keep the surrounding double quotation marks.

$ipAddress = "TODO"
Write-Output "Server $serverName will use IP address TODO"

# Expected output:
# Server SRV01 will use IP address 192.168.1.250
#
# This only prepares and displays local data.
# It does not configure the network or contact the server.
#
# Do not add Exercise 4 yet. Tell Codex "check" and paste the output.

#endregion Exercise 3
