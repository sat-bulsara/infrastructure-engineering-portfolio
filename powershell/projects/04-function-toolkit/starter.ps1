function Get-DriveHealth {
    [CmdletBinding()]
    param(
        [ValidateRange(1, 99)]
        [int]$WarningPercent = 20
    )

    # TODO: Reuse and improve Project 3 logic.
}

function Test-ServiceState {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory, ValueFromPipeline)]
        [string[]]$Name
    )

    process {
        # TODO: Return one structured result for every supplied name.
    }
}

function Restart-ServiceSafe {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact = 'High')]
    param(
        [Parameter(Mandatory)]
        [string]$Name
    )

    # TODO: Validate the service exists and call $PSCmdlet.ShouldProcess.
}
