# Exercise 02 - Numbers and calculations

# Scenario: calculate the total time spent learning PowerShell this week.

$weekdayMinutes = 25
$numberOfWeekdays = 5
$weekendMinutes = 60

# TODO 1:
# Multiply weekdayMinutes by numberOfWeekdays.
# Store the answer in a variable named $weekdayTotal.
$weekdayTotal = $weekdayMinutes * $numberOfWeekdays
# TODO 2:
# Add weekdayTotal and weekendMinutes.
# Store the answer in a variable named $weeklyTotal.
$weeklyTotal = $weekdayTotal + $weekendMinutes


# TODO 3:
# Complete this line so it displays the value of weeklyTotal.
Write-Host "I practised PowerShell for '$weeklyTotal' minutes this week."
