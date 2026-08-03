[CmdletBinding(SupportsShouldProcess, ConfirmImpact = "High")]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$SamAccountName
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory -ErrorAction Stop

$Departments = @("Sales", "Finance", "IT", "HR", "Marketing", "Operations")
$DepartmentGroups = @($Departments | ForEach-Object { "GG_${_}_Users" })
$DomainDN = "DC=ad,DC=anudia,DC=co,DC=uk"
$LeaversOU = "OU=Leavers,$DomainDN"
$LeaversGroup = "GG_Leavers"

# Validate the identity and all targets before disabling access.
$User = Get-ADUser `
    -Identity $SamAccountName `
    -Properties Enabled, Department, MemberOf, HomeDirectory, HomeDrive, DistinguishedName `
    -ErrorAction Stop

Get-ADOrganizationalUnit -Identity $LeaversOU -ErrorAction Stop | Out-Null
Get-ADGroup -Identity $LeaversGroup -ErrorAction Stop | Out-Null

$OriginalHomeDirectory = $User.HomeDirectory
$MembershipsBefore = @(
    Get-ADPrincipalGroupMembership `
        -Identity $SamAccountName `
        -ErrorAction Stop
)

if (-not $PSCmdlet.ShouldProcess(
        $SamAccountName,
        "Disable the account, remove departmental access, and move it to $LeaversOU"
    )) {
    return
}

try {
    if ($User.Enabled) {
        Disable-ADAccount `
            -Identity $SamAccountName `
            -ErrorAction Stop
    }

    $DepartmentMemberships = @(
        $MembershipsBefore |
            Where-Object { $_.Name -in $DepartmentGroups }
    )

    foreach ($Group in $DepartmentMemberships) {
        Remove-ADGroupMember `
            -Identity $Group.Name `
            -Members $SamAccountName `
            -Confirm:$false `
            -ErrorAction Stop
    }

    if ($MembershipsBefore.Name -notcontains $LeaversGroup) {
        Add-ADGroupMember `
            -Identity $LeaversGroup `
            -Members $SamAccountName `
            -ErrorAction Stop
    }

    Set-ADUser `
        -Identity $SamAccountName `
        -Department "Leaver" `
        -HomeDrive $null `
        -HomeDirectory $null `
        -ErrorAction Stop

    if ($User.DistinguishedName -notlike "*,$LeaversOU") {
        Move-ADObject `
            -Identity $User.DistinguishedName `
            -TargetPath $LeaversOU `
            -ErrorAction Stop
    }

    $VerifiedUser = Get-ADUser `
        -Identity $SamAccountName `
        -Properties Enabled, Department, HomeDirectory, HomeDrive, DistinguishedName `
        -ErrorAction Stop

    $VerifiedMemberships = @(
        Get-ADPrincipalGroupMembership `
            -Identity $SamAccountName `
            -ErrorAction Stop
    )

    $RemainingDepartmentGroups = @(
        $VerifiedMemberships |
            Where-Object { $_.Name -in $DepartmentGroups }
    )

    $RemainingGroupsForReview = @(
        $VerifiedMemberships |
            Where-Object {
                $_.Name -notin @("Domain Users", $LeaversGroup)
            } |
            Select-Object -ExpandProperty Name
    )

    $VerificationPassed = (
        -not $VerifiedUser.Enabled -and
        $VerifiedUser.Department -eq "Leaver" -and
        $VerifiedUser.DistinguishedName -like "*,$LeaversOU" -and
        [string]::IsNullOrWhiteSpace($VerifiedUser.HomeDrive) -and
        [string]::IsNullOrWhiteSpace($VerifiedUser.HomeDirectory) -and
        $VerifiedMemberships.Name -contains $LeaversGroup -and
        $RemainingDepartmentGroups.Count -eq 0
    )

    if (-not $VerificationPassed) {
        throw "Leaver verification failed for $SamAccountName."
    }

    [PSCustomObject]@{
        Action                    = "Leaver"
        SamAccountName            = $SamAccountName
        Enabled                   = $VerifiedUser.Enabled
        Department                = $VerifiedUser.Department
        DistinguishedName         = $VerifiedUser.DistinguishedName
        LeaversGroup              = $LeaversGroup
        DepartmentGroupsRemaining = $RemainingDepartmentGroups.Count
        OtherGroupsForReview      = $RemainingGroupsForReview -join ", "
        PreservedHomeDirectory    = $OriginalHomeDirectory
        Verified                  = $true
    }
}
catch {
    throw "Leaver processing stopped. Access was disabled first, but later steps may require manual completion. Error: $($_.Exception.Message)"
}
