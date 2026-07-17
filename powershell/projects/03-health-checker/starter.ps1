[CmdletBinding()]
param(
    [ValidateRange(1, 99)]
    [int]$WarningPercent = 20,

    [ValidateRange(0, 98)]
    [int]$CriticalPercent = 10
)

$ErrorActionPreference = 'Stop'

# TODO: Reject CriticalPercent >= WarningPercent.
# TODO: Get filesystem drives.
# TODO: Loop over them and calculate capacity/free percentage safely.
# TODO: Assign a state using if/elseif/else.
# TODO: Return structured drive results and determine the overall state.
