[CmdletBinding()]
param(
    [Parameter(Mandatory, ValueFromPipeline)]
    [string[]]$ComputerName,

    [Parameter(Mandatory)]
    [ValidateRange(1, 65535)]
    [int[]]$Port
)

begin {
    $ErrorActionPreference = 'Stop'
}

process {
    # TODO: Loop over each computer and port.
    # TODO: Time each attempt and catch DNS/connectivity errors.
    # TODO: Return a consistent object even when a test fails.
}
