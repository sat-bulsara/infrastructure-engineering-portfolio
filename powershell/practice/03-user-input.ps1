# Exercise 03 - User input

# Read-Host pauses the script, displays a question,
# and stores the user's typed response in a variable.

# Example:
# $colour = Read-Host "What is your favourite colour?"

# TODO 1:
# Ask: What is your name?
# Store the response in a variable named $name.
$name = Read-Host "What is your name?"


# TODO 2:
# Ask: What role do you want to learn?
# Store the response in a variable named $targetRole.
$targetRole = Read-Host "What role do you want to learn?"


# TODO 3:
# Replace both TODOs below with the correct variable names.
Write-Host "Hello $name. You are learning to become a $targetRole."
