#requires -Version 5.1
#requires -Modules ServerManager

<#
.SYNOPSIS
Runs a read-only health audit for the Windows PKI learning lab.

.DESCRIPTION
Checks the AD CS feature, CertSvc, CA registry configuration, trusted root
certificate, published template and newest local CRL. It makes no changes.

.EXAMPLE
.\test-pki-lab-health.ps1

.EXAMPLE
.\test-pki-lab-health.ps1 -CACommonName "ANUDIA-ROOT-CA" `
    -TemplateDisplayName "ANUDIA Workstation Authentication"
#>

[CmdletBinding()]
param(
    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$CACommonName = "ANUDIA-ROOT-CA",

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$TemplateDisplayName = "ANUDIA Workstation Authentication",

    [Parameter()]
    [ValidateNotNullOrEmpty()]
    [string]$CrlDirectory = "C:\Windows\System32\CertSrv\CertEnroll"
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$Results = [System.Collections.Generic.List[object]]::new()

function Add-AuditResult {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$Check,

        [Parameter(Mandatory)]
        [ValidateSet("Pass", "Fail", "Warning")]
        [string]$Status,

        [Parameter(Mandatory)]
        [string]$Evidence
    )

    $Results.Add([PSCustomObject]@{
        Check    = $Check
        Status   = $Status
        Evidence = $Evidence
    })
}

try {
    $Feature = Get-WindowsFeature -Name "ADCS-Cert-Authority"
    $FeatureStatus = if ($Feature.InstallState -eq "Installed") { "Pass" } else { "Fail" }
    Add-AuditResult -Check "AD CS role" -Status $FeatureStatus `
        -Evidence "InstallState=$($Feature.InstallState)"
}
catch {
    Add-AuditResult -Check "AD CS role" -Status "Fail" -Evidence $_.Exception.Message
}

try {
    $Service = Get-CimInstance Win32_Service -Filter "Name='CertSvc'"
    $ServiceStatus = if ($Service.State -eq "Running" -and $Service.StartMode -eq "Auto") {
        "Pass"
    }
    else {
        "Fail"
    }
    Add-AuditResult -Check "CertSvc" -Status $ServiceStatus `
        -Evidence "State=$($Service.State); StartMode=$($Service.StartMode)"
}
catch {
    Add-AuditResult -Check "CertSvc" -Status "Fail" -Evidence $_.Exception.Message
}

$ConfigurationRoot = "HKLM:\SYSTEM\CurrentControlSet\Services\CertSvc\Configuration"
$CaRegistryPath = Join-Path -Path $ConfigurationRoot -ChildPath $CACommonName
$RegistryStatus = if (Test-Path -Path $CaRegistryPath) { "Pass" } else { "Fail" }
Add-AuditResult -Check "CA registry configuration" -Status $RegistryStatus `
    -Evidence $CaRegistryPath

try {
    $RootCertificate = Get-ChildItem Cert:\LocalMachine\Root |
        Where-Object {
            $_.Subject -like "*CN=$CACommonName*" -and $_.Subject -eq $_.Issuer
        } |
        Sort-Object NotAfter -Descending |
        Select-Object -First 1

    if ($null -eq $RootCertificate) {
        Add-AuditResult -Check "Trusted self-signed root" -Status "Fail" `
            -Evidence "No matching self-signed root certificate found"
    }
    else {
        Add-AuditResult -Check "Trusted self-signed root" -Status "Pass" `
            -Evidence "Thumbprint=$($RootCertificate.Thumbprint); NotAfter=$($RootCertificate.NotAfter.ToString('s'))"
    }
}
catch {
    Add-AuditResult -Check "Trusted self-signed root" -Status "Fail" `
        -Evidence $_.Exception.Message
}

try {
    $TemplateOutput = (& certutil.exe -CATemplates 2>&1 | Out-String)
    $TemplateExitCode = $LASTEXITCODE
    $TemplateFound = $TemplateExitCode -eq 0 -and `
        $TemplateOutput -match [regex]::Escape($TemplateDisplayName)
    $TemplateStatus = if ($TemplateFound) { "Pass" } else { "Fail" }
    Add-AuditResult -Check "Published certificate template" -Status $TemplateStatus `
        -Evidence "Name=$TemplateDisplayName; certutilExitCode=$TemplateExitCode"
}
catch {
    Add-AuditResult -Check "Published certificate template" -Status "Fail" `
        -Evidence $_.Exception.Message
}

try {
    $NewestCrl = Get-ChildItem -Path $CrlDirectory -Filter "*.crl" |
        Sort-Object LastWriteTime -Descending |
        Select-Object -First 1

    if ($null -eq $NewestCrl) {
        Add-AuditResult -Check "Local CRL" -Status "Fail" `
            -Evidence "No CRL found in $CrlDirectory"
    }
    else {
        Add-AuditResult -Check "Local CRL" -Status "Pass" `
            -Evidence "File=$($NewestCrl.Name); LastWriteTime=$($NewestCrl.LastWriteTime.ToString('s'))"
    }
}
catch {
    Add-AuditResult -Check "Local CRL" -Status "Fail" -Evidence $_.Exception.Message
}

Add-AuditResult -Check "Client-side CDP and revocation verification" -Status "Warning" `
    -Evidence "Run separately from CLIENT01 using the issued certificate and its configured CDP"

$Results | Format-Table -AutoSize -Wrap

if ($Results.Status -contains "Fail") {
    exit 1
}

exit 0
