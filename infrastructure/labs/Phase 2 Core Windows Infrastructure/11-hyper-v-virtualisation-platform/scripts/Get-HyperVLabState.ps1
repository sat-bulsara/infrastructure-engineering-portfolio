<#
.SYNOPSIS
Collects a read-only summary of the Hyper-V learning lab.

.DESCRIPTION
Queries the Hyper-V host, the selected virtual machine, its network attachment,
firmware, disk and checkpoints. The script does not change configuration.

.PARAMETER VMName
The Hyper-V virtual machine to inspect.

.PARAMETER InternalSwitchName
The Internal virtual switch used by the lab.

.PARAMETER ExpectedHostAddress
The expected IPv4 address on the host-side virtual Ethernet adapter.

.EXAMPLE
.\Get-HyperVLabState.ps1 -Verbose

.NOTES
Run on the authorised Hyper-V host using an account permitted to query Hyper-V.
Review the output for hostnames and addresses before publishing it.
#>

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$VMName = "DC01",

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$InternalSwitchName = "HV-LAB-INTERNAL",

    [Parameter()]
    [ValidatePattern("^(?:\d{1,3}\.){3}\d{1,3}$")]
    [string]$ExpectedHostAddress = "10.10.10.1"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if (-not (Get-Module -ListAvailable -Name Hyper-V)) {
    throw "The Hyper-V PowerShell module is not available on this computer."
}

Import-Module Hyper-V

Write-Verbose "Reading Hyper-V role and service state."

$hyperVRoleState = "Unknown"
if (Get-Command -Name Get-WindowsFeature -ErrorAction SilentlyContinue) {
    $hyperVRoleState = (Get-WindowsFeature -Name Hyper-V).InstallState
}

$vmms = Get-Service -Name vmms
$vm = Get-VM -Name $VMName
$switch = Get-VMSwitch -Name $InternalSwitchName
$vmNetworkAdapter = Get-VMNetworkAdapter -VMName $VMName
$vmDisk = Get-VMHardDiskDrive -VMName $VMName |
    Select-Object -First 1

$checkpointCommand = Get-Command -Name Get-VMCheckpoint -ErrorAction SilentlyContinue
if ($checkpointCommand) {
    $checkpoints = @(Get-VMCheckpoint -VMName $VMName)
}
else {
    $checkpoints = @(Get-VMSnapshot -VMName $VMName)
}

$firmware = $null
if ($vm.Generation -eq 2) {
    $firmware = Get-VMFirmware -VMName $VMName
}

$hostInterfaceAlias = "vEthernet ($InternalSwitchName)"
$hostIPv4Addresses = @(
    Get-NetIPAddress `
        -InterfaceAlias $hostInterfaceAlias `
        -AddressFamily IPv4 `
        -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty IPAddress
)

$guestReportedAddresses = @($vmNetworkAdapter.IPAddresses) |
    Where-Object { $_ }

[PSCustomObject]@{
    CollectedAt                 = Get-Date
    HostComputer                = $env:COMPUTERNAME
    HyperVRoleState             = [string]$hyperVRoleState
    VMManagementService         = [string]$vmms.Status
    VMName                      = $vm.Name
    VMState                     = [string]$vm.State
    Generation                  = $vm.Generation
    StartupMemoryGB             = [math]::Round($vm.MemoryStartup / 1GB, 2)
    DynamicMemoryEnabled        = $vm.DynamicMemoryEnabled
    CheckpointType              = [string]$vm.CheckpointType
    AutomaticCheckpointsEnabled = $vm.AutomaticCheckpointsEnabled
    CheckpointCount             = $checkpoints.Count
    SwitchName                  = $switch.Name
    SwitchType                  = [string]$switch.SwitchType
    VMNetworkSwitch             = $vmNetworkAdapter.SwitchName
    GuestReportedIPAddresses    = $guestReportedAddresses -join ", "
    HostInternalIPv4Addresses   = $hostIPv4Addresses -join ", "
    ExpectedHostAddress         = $ExpectedHostAddress
    ExpectedHostAddressPresent  = $hostIPv4Addresses -contains $ExpectedHostAddress
    PrimaryVHDPath              = $vmDisk.Path
    SecureBoot                  = if ($firmware) { [string]$firmware.SecureBoot } else { "Not applicable" }
    SecureBootTemplate          = if ($firmware) { [string]$firmware.SecureBootTemplate } else { "Not applicable" }
}
