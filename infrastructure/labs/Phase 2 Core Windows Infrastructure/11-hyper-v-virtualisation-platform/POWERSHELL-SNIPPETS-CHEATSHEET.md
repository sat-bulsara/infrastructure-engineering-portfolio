# Hyper-V PowerShell Snippets Cheatsheet

These snippets are references for the disposable lab. Inspect the current
state, confirm the target host or VM, and run one change at a time. Commands
such as switch creation, checkpoint restore, forced power-off and firewall
changes can interrupt services or discard state.

## Check Hyper-V Hardware Requirements

Run this before installing the Hyper-V role. After the hypervisor is active,
`systeminfo.exe` reports that a hypervisor has been detected instead of listing
the original requirement values.

```powershell
systeminfo.exe |
    Select-String "Hyper-V Requirements" -Context 0,4
```

## Install Hyper-V

```powershell
Install-WindowsFeature `
    -Name Hyper-V `
    -IncludeManagementTools `
    -Restart
```

## Check Hyper-V Service

```powershell
Get-Service vmms
```

## VM Inventory

```powershell
Get-VM |
    Select-Object Name, State, Generation
```

## Switch Inventory

```powershell
Get-VMSwitch |
    Select-Object Name, SwitchType
```

## Create Internal Switch

```powershell
New-VMSwitch `
    -Name "HV-LAB-INTERNAL" `
    -SwitchType Internal
```

## Create Private Switch

```powershell
New-VMSwitch `
    -Name "HV-LAB-PRIVATE" `
    -SwitchType Private
```

## Configure Host Internal IP

Inspect the exact host-side adapter and existing addresses first:

```powershell
Get-NetAdapter `
    -Name "vEthernet (HV-LAB-INTERNAL)"

Get-NetIPAddress `
    -InterfaceAlias "vEthernet (HV-LAB-INTERNAL)" `
    -AddressFamily IPv4
```

Only create the address if it does not already exist:

```powershell
New-NetIPAddress `
    -InterfaceAlias "vEthernet (HV-LAB-INTERNAL)" `
    -IPAddress "10.10.10.1" `
    -PrefixLength 24
```

## Optional NAT for Follow-on Labs

Adding NAT changes the isolation boundary. Inspect existing NAT objects and use
this only when the guest needs outbound access. The guest would also need
`10.10.10.1` as its default gateway.

```powershell
Get-NetNat
```

```powershell
New-NetNat `
    -Name "HV-LAB-NAT" `
    -InternalIPInterfaceAddressPrefix "10.10.10.0/24"
```

## Create Dynamic VHDX

```powershell
New-VHD `
    -Path "C:\Hyper-V\Virtual Hard Disks\LAB-TEST-DISK.vhdx" `
    -SizeBytes 20GB `
    -Dynamic
```

## Inspect VHDX

```powershell
Get-VHD `
    -Path "C:\Hyper-V\Virtual Hard Disks\LAB-TEST-DISK.vhdx"
```

## Create VM

```powershell
New-VM `
    -Name "DC01" `
    -Generation 2 `
    -MemoryStartupBytes 4GB `
    -Path "C:\Hyper-V\VMs" `
    -NewVHDPath "C:\Hyper-V\Virtual Hard Disks\DC01-OS.vhdx" `
    -NewVHDSizeBytes 80GB `
    -SwitchName "HV-LAB-INTERNAL"
```

Enable Dynamic Memory with explicit limits while the VM is off:

```powershell
Set-VMMemory `
    -VMName "DC01" `
    -DynamicMemoryEnabled $true `
    -MinimumBytes 2GB `
    -StartupBytes 4GB `
    -MaximumBytes 8GB
```

Attach the reviewed installation ISO:

```powershell
Add-VMDvdDrive `
    -VMName "DC01" `
    -Path "C:\Hyper-V\ISO\Windows-Server-2025.iso"
```

## Start / Stop

```powershell
Start-VM -Name "DC01"
Stop-VM -Name "DC01"
```

Forced power-off:

```powershell
Stop-VM -Name "DC01" -TurnOff
```

`-TurnOff` is equivalent to removing power. Use it only when a normal guest
shutdown is unavailable and the risk of data loss is understood.

## Inspect VM NIC

```powershell
Get-VMNetworkAdapter `
    -VMName "DC01" |
    Select-Object VMName,
                  SwitchName,
                  Status,
                  MacAddress,
                  IPAddresses
```

The IP list depends on guest integration reporting. An empty value does not by
itself prove that the guest has no configured address.

## Inspect VM Disk

```powershell
Get-VMHardDiskDrive `
    -VMName "DC01" |
    Select-Object VMName, Path
```

## Inspect ISO

```powershell
Get-VMDvdDrive `
    -VMName "DC01" |
    Select-Object VMName, Path
```

## Inspect Firmware

```powershell
Get-VMFirmware -VMName "DC01" |
    Select-Object VMName,
                  SecureBoot,
                  SecureBootTemplate
```

## Boot Order

```powershell
Get-VMFirmware -VMName "DC01" |
    Select-Object -ExpandProperty BootOrder |
    Select-Object BootType, Device
```

## Set DVD First

```powershell
$dvdDrive = Get-VMDvdDrive -VMName "DC01"

Set-VMFirmware `
    -VMName "DC01" `
    -FirstBootDevice $dvdDrive
```

## Secure Boot

Inspect the current setting before changing it:

```powershell
Get-VMFirmware -VMName "DC01" |
    Select-Object VMName, SecureBoot, SecureBootTemplate
```

Disable only as a controlled troubleshooting step while the VM is off:

```powershell
Set-VMFirmware `
    -VMName "DC01" `
    -EnableSecureBoot Off
```

Re-enable Secure Boot after installation when the guest supports it, then boot
and verify Windows:

```powershell
Set-VMFirmware `
    -VMName "DC01" `
    -EnableSecureBoot On `
    -SecureBootTemplate "MicrosoftWindows"
```

## Checkpoint Configuration

```powershell
Get-VM -Name "DC01" |
    Select-Object Name,
                  CheckpointType,
                  AutomaticCheckpointsEnabled
```

## Create Checkpoint

```powershell
Checkpoint-VM `
    -Name "DC01" `
    -SnapshotName "Baseline - Windows Installed"
```

## List Checkpoints

```powershell
Get-VMCheckpoint `
    -VMName "DC01" |
    Select-Object VMName,
                  Name,
                  SnapshotType,
                  CreationTime
```

## Restore Checkpoint

```powershell
Restore-VMCheckpoint `
    -VMName "DC01" `
    -Name "Baseline - Windows Installed"
```

Keep the confirmation prompt unless the checkpoint target and rollback impact
have already been independently validated.

## Inside Guest: Rename

```powershell
Rename-Computer `
    -NewName "DC01" `
    -Restart
```

## Inside Guest: Static IPv4

```powershell
New-NetIPAddress `
    -InterfaceAlias "Ethernet" `
    -IPAddress "10.10.10.10" `
    -PrefixLength 24
```

## Discover ICMP Firewall Rules

```powershell
$candidateRules = Get-NetFirewallRule `
    -DisplayName "*Echo Request*ICMPv4*" |
    Where-Object {
        $_.Direction -eq "Inbound" -and
        $_.Action -eq "Allow"
    } |
    Select-Object Name,
                  DisplayName,
                  Enabled,
                  Profile,
                  Direction,
                  Action

$candidateRules
```

## Enable Required ICMP Allow Rule

Choose the exact `Name` from the reviewed output instead of enabling every
wildcard match:

```powershell
Enable-NetFirewallRule `
    -Name "<verified-rule-name>"

Get-NetFirewallRule `
    -Name "<verified-rule-name>" |
    Select-Object Name, Enabled, Profile, Direction, Action
```

## Connectivity Test

```powershell
Test-Connection `
    -ComputerName "10.10.10.10" `
    -Count 2
```

Check the `Source` column to confirm which machine actually ran the test.

## Collect Read-Only Final State

Run from the project root on the Hyper-V host:

```powershell
.\scripts\Get-HyperVLabState.ps1 -Verbose
```

Review the output for identifiers before saving or publishing it.

## PowerShell Patterns

### Array

```powershell
$Folders = @(
    "C:\Hyper-V\VMs"
    "C:\Hyper-V\Virtual Hard Disks"
    "C:\Hyper-V\ISO"
)
```

### foreach

```powershell
foreach ($Folder in $Folders) {
    New-Item -Path $Folder -ItemType Directory -Force
}
```

### Pipeline

```powershell
Get-VM |
    Select-Object Name, State
```

### Where-Object

```powershell
Get-NetAdapter |
    Where-Object Status -eq "Up"
```

### PSCustomObject

```powershell
[PSCustomObject]@{
    Host = $env:COMPUTERNAME
    VM   = "DC01"
}
```
