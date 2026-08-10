# Enterprise File Services - PowerShell Cheat Sheet

Reference commands based on the Enterprise File Services project. Read each
section before running it. Discovery commands are read-only; folder, ACL, share,
DFS, and VSS commands change server state and require an elevated session.

The examples use the disposable `ad.anudia.co.uk` lab names. They are not a
single copy-and-run deployment script.

## SMB share inventory

``` powershell
# List SMB shares and their physical paths.
Get-SmbShare |
    Select-Object Name,Path,Description
```

## Share permissions

``` powershell
# Show the SMB permissions for one share.
Get-SmbShareAccess -Name "IT$"
```

## NTFS permissions

``` powershell
# Display the NTFS ACL for a folder.
icacls "C:\Shares\IT"
```

## Create department folders

``` powershell
# Departments that need folders.
$Departments = "Finance","HR","Marketing","Operations","Sales"

# Create each folder beneath C:\Shares.
foreach ($Department in $Departments) {
    New-Item `
        -Path "C:\Shares\$Department" `
        -ItemType Directory `
        -Force
}
```

## Apply departmental NTFS permissions

`icacls` does not support PowerShell `-WhatIf`. The following sequence validates
the target, saves the current ACL, applies the narrow departmental model, and
checks every native-command exit code. Review the backup before proceeding.

``` powershell
# Departments to configure.
$Departments = "Finance","HR","Marketing","Operations","Sales"
$BackupRoot  = "C:\Admin\ACL-Backups"

New-Item -Path $BackupRoot -ItemType Directory -Force | Out-Null

foreach ($Department in $Departments) {

    # Build the folder and matching AD group names.
    $Path        = "C:\Shares\$Department"
    $GroupName   = "GG_${Department}_Users"
    $Group       = "AD\$GroupName"
    $AclBackup   = Join-Path $BackupRoot "$Department-before.txt"

    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        throw "Folder not found: $Path"
    }

    Get-ADGroup -Identity $GroupName -ErrorAction Stop | Out-Null

    # Save the current ACL before making a change.
    icacls $Path /save $AclBackup /T /C
    if ($LASTEXITCODE -ne 0) {
        throw "ACL backup failed for $Path"
    }

    $Confirmation = Read-Host "Type APPLY to replace the ACL on $Path"
    if ($Confirmation -cne "APPLY") {
        Write-Warning "No ACL change was made to $Path."
        continue
    }

    # Remove inherited ACL entries.
    icacls $Path /inheritance:r
    if ($LASTEXITCODE -ne 0) {
        throw "Could not disable inheritance on $Path"
    }

    # Replace explicit entries so safe reruns do not create duplicates.
    icacls $Path /grant:r "BUILTIN\Administrators:(OI)(CI)F"
    if ($LASTEXITCODE -ne 0) {
        throw "Could not grant Administrators access on $Path"
    }

    icacls $Path /grant:r "SYSTEM:(OI)(CI)F"
    if ($LASTEXITCODE -ne 0) {
        throw "Could not grant SYSTEM access on $Path"
    }

    # Department users receive Modify on files and subfolders.
    icacls $Path /grant:r "${Group}:(OI)(CI)M"
    if ($LASTEXITCODE -ne 0) {
        throw "Could not grant $Group access on $Path"
    }

    # Independently display the final ACL.
    icacls $Path
}
```

## Enable ABE

``` powershell
# Preview the change first.
Set-SmbShare `
    -Name "IT$" `
    -FolderEnumerationMode AccessBased `
    -WhatIf

# Apply after reviewing the preview.
Set-SmbShare `
    -Name "IT$" `
    -FolderEnumerationMode AccessBased `
    -Force

Get-SmbShare -Name "IT$" |
    Select-Object Name,FolderEnumerationMode
```

## Create departmental SMB shares

``` powershell
$Departments = "Finance","HR","Marketing","Operations","Sales"

foreach ($Department in $Departments) {

    $ShareName = "$Department`$"
    $Path      = "C:\Shares\$Department"

    if (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue) {
        Write-Warning "$ShareName already exists. No change was made."
        continue
    }

    if (-not (Test-Path -LiteralPath $Path -PathType Container)) {
        throw "Folder not found: $Path"
    }

    $ShareParameters = @{
        Name                  = $ShareName
        Path                  = $Path
        FullAccess            = "AD\Domain Admins"
        ChangeAccess          = "AD\GG_${Department}_Users"
        FolderEnumerationMode = "AccessBased"
    }

    # Preview, then create the hidden share.
    New-SmbShare @ShareParameters -WhatIf

    $Confirmation = Read-Host "Type CREATE to create $ShareName"
    if ($Confirmation -cne "CREATE") {
        Write-Warning "$ShareName was not created."
        continue
    }

    New-SmbShare @ShareParameters

    Get-SmbShareAccess -Name $ShareName |
        Select-Object AccountName,AccessRight,AccessControlType
}
```

## Client access tests

``` powershell
# Authorised path.
Test-Path "\\SRV01\IT$"

# Unauthorised department path.
Test-Path "\\SRV01\Finance$"
```

## Audit all SMB permissions

``` powershell
$Departments = "Finance","HR","IT","Marketing","Operations","Sales"

foreach ($Department in $Departments) {

    Write-Host "`n--- $Department ---"

    Get-SmbShareAccess -Name "$Department`$" |
        Select-Object AccountName,AccessRight,AccessControlType
}
```

## Audit all NTFS ACLs

``` powershell
$Departments = "Finance","HR","IT","Marketing","Operations","Sales"

foreach ($Department in $Departments) {

    $Path = "C:\Shares\$Department"

    Write-Host "`n--- $Department ---"

    icacls $Path
}
```

## DFS role check

``` powershell
# Check DFS Namespace and Replication installation state.
Get-WindowsFeature FS-DFS-Namespace,FS-DFS-Replication
```

## Install DFS Namespaces

``` powershell
# Install DFS Namespace and its management tools.
Install-WindowsFeature `
    -Name FS-DFS-Namespace `
    -IncludeManagementTools
```

## Add DFS folders

``` powershell
$Departments = "Finance","HR","Marketing","Operations","Sales"

foreach ($Department in $Departments) {

    # Build the logical DFS path.
    $DfsPath = "\\ad.anudia.co.uk\Departments\$Department"

    # Build the existing SMB target.
    $TargetPath = "\\SRV01\$Department`$"

    if (Get-DfsnFolder -Path $DfsPath -ErrorAction SilentlyContinue) {
        Write-Warning "$DfsPath already exists. No change was made."
        continue
    }

    # Preview, then create the DFS folder and target.
    New-DfsnFolder `
        -Path $DfsPath `
        -TargetPath $TargetPath `
        -WhatIf

    $Confirmation = Read-Host "Type CREATE to add $DfsPath"
    if ($Confirmation -cne "CREATE") {
        Write-Warning "$DfsPath was not created."
        continue
    }

    New-DfsnFolder `
        -Path $DfsPath `
        -TargetPath $TargetPath
}
```

## List DFS folders

``` powershell
Get-DfsnFolder `
    -Path "\\ad.anudia.co.uk\Departments\*" |
    Select-Object Path,State

Get-DfsnFolder -Path "\\ad.anudia.co.uk\Departments\*" |
    ForEach-Object {
        Get-DfsnFolderTarget -Path $_.Path
    } |
    Select-Object Path,TargetPath,State
```

## DFS client tests

``` powershell
# IT should be reachable for an IT user.
Test-Path "\\ad.anudia.co.uk\Departments\IT"

# Finance should be denied for the IT test user.
Test-Path "\\ad.anudia.co.uk\Departments\Finance"
```

## VSS volume check

``` powershell
# Requires elevated PowerShell.
vssadmin list volumes
```

## Create a VSS snapshot

``` powershell
# Access the Windows shadow-copy management class.
$ShadowClass = [wmiclass]"root\cimv2:Win32_ShadowCopy"

$Confirmation = Read-Host "Type SNAPSHOT to create a VSS snapshot of C:"
if ($Confirmation -cne "SNAPSHOT") {
    throw "Snapshot creation cancelled."
}

# Create a client-accessible snapshot of C:.
$Result = $ShadowClass.Create("C:\","ClientAccessible")

# Display the result.
$Result

if ($Result.ReturnValue -ne 0) {
    throw "VSS snapshot creation failed with return value $($Result.ReturnValue)."
}

# Verify the resulting inventory independently.
Get-CimInstance Win32_ShadowCopy |
    Sort-Object InstallDate -Descending |
    Select-Object InstallDate,DeviceObject,ID
```

## List shadow copies

``` powershell
Get-CimInstance Win32_ShadowCopy |
    Sort-Object InstallDate -Descending |
    Select-Object InstallDate,DeviceObject,ID
```

## Temporarily expose a VSS snapshot

``` powershell
# Select and inspect the required recovery point. This example chooses the
# newest snapshot, so confirm its InstallDate before continuing.
$Shadow = Get-CimInstance Win32_ShadowCopy |
    Sort-Object InstallDate -Descending |
    Select-Object -First 1

if (-not $Shadow) {
    throw "No VSS snapshot was found."
}

$Shadow | Select-Object InstallDate,DeviceObject,ID

if (Test-Path -LiteralPath "C:\ShadowCopy") {
    throw "C:\ShadowCopy already exists."
}

$DevicePath = "$($Shadow.DeviceObject)\"
cmd.exe /c "mklink /d C:\ShadowCopy `"$DevicePath`""

if ($LASTEXITCODE -ne 0) {
    throw "The temporary VSS link could not be created."
}
```

## Read a historical file

``` powershell
Get-Content "C:\ShadowCopy\Shares\IT\recovery-test.txt"
```

## Restore a historical file

``` powershell
Copy-Item `
    -Path "C:\ShadowCopy\Shares\IT\recovery-test.txt" `
    -Destination "C:\Shares\IT\recovery-test.txt" `
    -Force
```

## Remove the temporary VSS link

``` powershell
cmd /c rmdir C:\ShadowCopy

if (Test-Path -LiteralPath "C:\ShadowCopy") {
    throw "The temporary VSS link still exists."
}
```

## Build a departmental NTFS report

``` powershell
$Departments = "Finance","HR","IT","Marketing","Operations","Sales"

$Report = foreach ($Department in $Departments) {

    $Path      = "C:\Shares\$Department"
    $ShareName = "$Department`$"
    $Acl       = Get-Acl $Path

    foreach ($Entry in $Acl.Access) {

        [PSCustomObject]@{
            Department = $Department
            Share      = $ShareName
            Identity   = $Entry.IdentityReference
            Rights     = $Entry.FileSystemRights
            Type       = $Entry.AccessControlType
            Inherited  = $Entry.IsInherited
        }
    }
}

$Report | Format-Table -AutoSize
```

## Final health check

``` powershell
# Departmental SMB shares.
Get-SmbShare |
    Where-Object Name -in @(
        "Finance$","HR$","IT$",
        "Marketing$","Operations$","Sales$"
    ) |
    Select-Object Name,Path,FolderEnumerationMode

# Exact SMB ACLs.
$Departments = "Finance","HR","IT","Marketing","Operations","Sales"
foreach ($Department in $Departments) {
    Get-SmbShareAccess -Name "$Department`$" |
        Select-Object @{Name="Share";Expression={"$Department`$"}},
                      AccountName,AccessRight,AccessControlType
}

# DFS folders.
Get-DfsnFolder `
    -Path "\\ad.anudia.co.uk\Departments\*" |
    Select-Object Path,State

# Exact DFS targets.
Get-DfsnFolder -Path "\\ad.anudia.co.uk\Departments\*" |
    ForEach-Object {
        Get-DfsnFolderTarget -Path $_.Path
    } |
    Select-Object Path,TargetPath,State

# VSS snapshots.
Get-CimInstance Win32_ShadowCopy |
    Select-Object InstallDate,DeviceObject
```
