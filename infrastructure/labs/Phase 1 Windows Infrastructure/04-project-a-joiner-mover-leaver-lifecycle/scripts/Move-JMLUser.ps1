[CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$SamAccountName,

    [Parameter(Mandatory)]
    [ValidateSet("Sales", "Finance", "IT", "HR", "Marketing", "Operations")]
    [string]$NewDepartment
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory -ErrorAction Stop

$Departments = @("Sales", "Finance", "IT", "HR", "Marketing", "Operations")
$DomainDN = "DC=ad,DC=anudia,DC=co,DC=uk"
$NewOU = "OU=$NewDepartment,OU=Departments,$DomainDN"
$NewGroup = "GG_${NewDepartment}_Users"
$DepartmentGroups = @($Departments | ForEach-Object { "GG_${_}_Users" })

# Validate the user and every new target before changing access.
$User = Get-ADUser `
    -Identity $SamAccountName `
    -Properties Department, DistinguishedName `
    -ErrorAction Stop

Get-ADOrganizationalUnit -Identity $NewOU -ErrorAction Stop | Out-Null
Get-ADGroup -Identity $NewGroup -ErrorAction Stop | Out-Null

$PreviousDepartment = $User.Department
$MembershipsBefore = @(
    Get-ADPrincipalGroupMembership `
        -Identity $SamAccountName `
        -ErrorAction Stop
)

$ObsoleteDepartmentGroups = @(
    $MembershipsBefore |
        Where-Object {
            $_.Name -in $DepartmentGroups -and
            $_.Name -ne $NewGroup
        }
)

$AlreadyComplete = (
    $User.Department -eq $NewDepartment -and
    $User.DistinguishedName -like "*,$NewOU" -and
    $MembershipsBefore.Name -contains $NewGroup -and
    $ObsoleteDepartmentGroups.Count -eq 0
)

if ($AlreadyComplete) {
    [PSCustomObject]@{
        Action            = "Mover"
        SamAccountName    = $SamAccountName
        PreviousDepartment = $PreviousDepartment
        NewDepartment     = $NewDepartment
        DistinguishedName = $User.DistinguishedName
        DepartmentGroup   = $NewGroup
        Changed           = $false
        Verified          = $true
    }
    return
}

if (-not $PSCmdlet.ShouldProcess(
        $SamAccountName,
        "Move from '$PreviousDepartment' to '$NewDepartment' and replace departmental access"
    )) {
    return
}

try {
    if ($MembershipsBefore.Name -notcontains $NewGroup) {
        Add-ADGroupMember `
            -Identity $NewGroup `
            -Members $SamAccountName `
            -ErrorAction Stop
    }

    foreach ($Group in $ObsoleteDepartmentGroups) {
        Remove-ADGroupMember `
            -Identity $Group.Name `
            -Members $SamAccountName `
            -Confirm:$false `
            -ErrorAction Stop
    }

    if ($User.Department -ne $NewDepartment) {
        Set-ADUser `
            -Identity $SamAccountName `
            -Department $NewDepartment `
            -ErrorAction Stop
    }

    if ($User.DistinguishedName -notlike "*,$NewOU") {
        Move-ADObject `
            -Identity $User.DistinguishedName `
            -TargetPath $NewOU `
            -ErrorAction Stop
    }

    $VerifiedUser = Get-ADUser `
        -Identity $SamAccountName `
        -Properties Department, DistinguishedName `
        -ErrorAction Stop

    $VerifiedMemberships = @(
        Get-ADPrincipalGroupMembership `
            -Identity $SamAccountName `
            -ErrorAction Stop
    )

    $RemainingObsoleteGroups = @(
        $VerifiedMemberships |
            Where-Object {
                $_.Name -in $DepartmentGroups -and
                $_.Name -ne $NewGroup
            }
    )

    $VerificationPassed = (
        $VerifiedUser.Department -eq $NewDepartment -and
        $VerifiedUser.DistinguishedName -like "*,$NewOU" -and
        $VerifiedMemberships.Name -contains $NewGroup -and
        $RemainingObsoleteGroups.Count -eq 0
    )

    if (-not $VerificationPassed) {
        throw "Mover verification failed for $SamAccountName."
    }

    [PSCustomObject]@{
        Action             = "Mover"
        SamAccountName     = $SamAccountName
        PreviousDepartment = $PreviousDepartment
        NewDepartment      = $VerifiedUser.Department
        DistinguishedName  = $VerifiedUser.DistinguishedName
        DepartmentGroup    = $NewGroup
        Changed            = $true
        Verified           = $true
    }
}
catch {
    throw "Mover processing stopped. The account may be partially updated; run read-only verification before retrying. Error: $($_.Exception.Message)"
}
