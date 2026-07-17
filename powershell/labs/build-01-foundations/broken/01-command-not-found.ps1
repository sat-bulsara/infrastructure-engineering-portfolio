# Break/fix challenge: make this script list the five newest processes.
# Record the exact error before changing the command.

Get-Proces |
    Sort-Object -Property StartTime -Descending |
    Select-Object -First 5 -Property Name, Id, StartTime
