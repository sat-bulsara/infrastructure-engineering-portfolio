[CmdletBinding(SupportsShouldProcess, ConfirmImpact = "Medium")]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$FirstName,

    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$LastName,

    [Parameter(Mandatory)]
    [ValidateSet("Sales", "Finance", "IT", "HR", "Marketing", "Operations")]
    [string]$Department
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

Import-Module ActiveDirectory -ErrorAction Stop

$DomainDN = "DC=ad,DC=anudia,DC=co,DC=uk"
$UpnSuffix = "ad.anudia.co.uk"
$SamAccountName = "$FirstName.$LastName".ToLowerInvariant()
$TargetOU = "OU=$Department,OU=Departments,$DomainDN"
$TargetGroup = "GG_${Department}_Users"

if ($SamAccountName.Length -gt 20) {
    throw "Generated SamAccountName '$SamAccountName' exceeds the 20-character limit."
}

# Validate every target before creating the account.
Get-ADOrganizationalUnit -Identity $TargetOU -ErrorAction Stop | Out-Null
Get-ADGroup -Identity $TargetGroup -ErrorAction Stop | Out-Null

$EscapedSamAccountName = $SamAccountName.Replace("'", "''")
$ExistingUser = Get-ADUser `
    -Filter "SamAccountName -eq '$EscapedSamAccountName'" `
    -ErrorAction Stop

if ($ExistingUser) {
    throw "User $SamAccountName already exists. No changes were made."
}

if (-not $PSCmdlet.ShouldProcess(
        $SamAccountName,
        "Create the account in $TargetOU and add it to $TargetGroup"
    )) {
    return
}

$Password = Read-Host "Enter temporary password" -AsSecureString
$UserCreated = $false

try {
    New-ADUser `
        -Name "$FirstName $LastName" `
        -GivenName $FirstName `
        -Surname $LastName `
        -SamAccountName $SamAccountName `
        -UserPrincipalName "$SamAccountName@$UpnSuffix" `
        -Department $Department `
        -Path $TargetOU `
        -AccountPassword $Password `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -ErrorAction Stop

    $UserCreated = $true

    Add-ADGroupMember `
        -Identity $TargetGroup `
        -Members $SamAccountName `
        -ErrorAction Stop

    $VerifiedUser = Get-ADUser `
        -Identity $SamAccountName `
        -Properties Department, Enabled, DistinguishedName `
        -ErrorAction Stop

    $VerifiedGroups = @(
        Get-ADPrincipalGroupMembership `
            -Identity $SamAccountName `
            -ErrorAction Stop
    )

    $VerificationPassed = (
        $VerifiedUser.Enabled -and
        $VerifiedUser.Department -eq $Department -and
        $VerifiedUser.DistinguishedName -like "*,$TargetOU" -and
        $VerifiedGroups.Name -contains $TargetGroup
    )

    if (-not $VerificationPassed) {
        throw "Joiner verification failed for $SamAccountName."
    }

    [PSCustomObject]@{
        Action            = "Joiner"
        SamAccountName    = $SamAccountName
        Department        = $VerifiedUser.Department
        Enabled           = $VerifiedUser.Enabled
        DistinguishedName = $VerifiedUser.DistinguishedName
        DepartmentGroup   = $TargetGroup
        Verified          = $true
    }
}
catch {
    $ProvisioningError = $_

    if ($UserCreated) {
        try {
            Disable-ADAccount -Identity $SamAccountName -ErrorAction Stop
            Write-Warning "The account was created but a later step failed. It has been disabled for manual review."
        }
        catch {
            Write-Warning "The partially created account could not be disabled automatically. Review it immediately."
        }
    }

    throw "Joiner provisioning stopped: $($ProvisioningError.Exception.Message)"
}
