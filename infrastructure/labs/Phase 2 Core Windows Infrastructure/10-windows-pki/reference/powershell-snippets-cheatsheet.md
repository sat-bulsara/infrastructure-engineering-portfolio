# PowerShell Snippets for Windows PKI

These commands support discovery and verification in the lab. Commands that change infrastructure are labelled clearly.

## Inventory AD CS

Read-only:

```powershell
Get-WindowsFeature -Name "ADCS*" |
    Select-Object DisplayName, Name, InstallState
```

## Check Server Identity

Read-only:

```powershell
Get-ComputerInfo |
    Select-Object CsName, CsDomain, WindowsProductName
```

## Install the CA Role

Changes the server by installing the Certification Authority role and management tools:

```powershell
Install-WindowsFeature `
    -Name ADCS-Cert-Authority `
    -IncludeManagementTools
```

## Configure the CA

Changes the server by creating the certification authority. The CA name and hierarchy should be decided before this step.

```powershell
$CaParameters = @{
    CAType              = "EnterpriseRootCA"
    CACommonName        = "ANUDIA-ROOT-CA"
    KeyLength           = 4096
    HashAlgorithmName   = "SHA256"
    CryptoProviderName  = "RSA#Microsoft Software Key Storage Provider"
    ValidityPeriod      = "Years"
    ValidityPeriodUnits = 10
}

Install-AdcsCertificationAuthority @CaParameters
```

## Check the CA Service

Read-only:

```powershell
Get-Service CertSvc |
    Select-Object Name, Status, StartType
```

## Check the CA Registry Path

Read-only:

```powershell
Test-Path "HKLM:\SYSTEM\CurrentControlSet\Services\CertSvc\Configuration"
```

## Find the Root Certificate

Read-only:

```powershell
$CaName = "ANUDIA-ROOT-CA"

Get-ChildItem Cert:\LocalMachine\Root |
    Where-Object {
        $_.Subject -like "*CN=$CaName*"
    } |
    Select-Object Subject, Issuer, NotBefore, NotAfter, Thumbprint
```

For a self-signed root certificate, Subject and Issuer should identify the same CA.

## Find CLIENT01 Certificates

Read-only on `CLIENT01`:

```powershell
Get-ChildItem Cert:\LocalMachine\My |
    Where-Object {
        $_.Issuer -like "*CN=ANUDIA-ROOT-CA*"
    } |
    Select-Object Subject, Issuer, NotBefore, NotAfter,
        Thumbprint, HasPrivateKey, EnhancedKeyUsageList
```

## Store and Reuse a Certificate Object

```powershell
$Certificate = Get-ChildItem Cert:\LocalMachine\My |
    Where-Object {
        $_.Issuer -like "*CN=ANUDIA-ROOT-CA*"
    } |
    Sort-Object NotBefore -Descending |
    Select-Object -First 1

$Certificate.Subject
$Certificate.Issuer
$Certificate.HasPrivateKey
```

## Export Only the Public Certificate

Creates a public `.cer` file. It does not export the private key:

```powershell
$OutputDirectory = "C:\Temp"
New-Item -Path $OutputDirectory -ItemType Directory -Force | Out-Null

Export-Certificate `
    -Cert $Certificate `
    -FilePath "$OutputDirectory\CLIENT01-workstation.cer"
```

Do not use `Export-PfxCertificate` unless private-key export is explicitly required and protected.

## Check Pending Reboot State

Read-only:

```powershell
$PendingRebootPaths = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired"
)

foreach ($Path in $PendingRebootPaths) {
    [PSCustomObject]@{
        Path    = $Path
        Pending = Test-Path $Path
    }
}
```

## Inspect Windows Servicing

Read-only:

```powershell
Get-Process TiWorker, TrustedInstaller -ErrorAction SilentlyContinue |
    Select-Object ProcessName, Id, CPU, StartTime

Get-Content "C:\Windows\Logs\CBS\CBS.log" -Tail 20
```

Adding `-Wait` to `Get-Content` keeps the command open and displays new log entries until it is stopped.

## Inspect CRL Files

Read-only:

```powershell
$CrlDirectory = "C:\Windows\System32\CertSrv\CertEnroll"

Get-ChildItem -Path $CrlDirectory -Filter "*.crl" |
    Sort-Object LastWriteTime -Descending |
    Select-Object Name, Length, LastWriteTime
```

## Publish a New CRL

Changes CA state by publishing a new CRL:

```powershell
certutil -CRL
```

## Inspect the Newest CRL

Read-only:

```powershell
$Crl = Get-ChildItem -Path $CrlDirectory -Filter "*.crl" |
    Sort-Object LastWriteTime -Descending |
    Select-Object -First 1

certutil -dump $Crl.FullName
```

## Useful certutil Commands

```powershell
certutil -getreg CA\CommonName
certutil -CAInfo
certutil -CATemplates
certutil -verify "C:\Temp\CLIENT01-workstation.cer"
certutil -CRL
```

`certutil` emits text rather than normal PowerShell objects. Check `$LASTEXITCODE` and retain the relevant output when using it as evidence.

## Core PowerShell Patterns

### Retrieve, filter and select

```powershell
Get-ChildItem ... |
    Where-Object { ... } |
    Select-Object ...
```

### Retrieve, sort and select one object

```powershell
Get-ChildItem ... |
    Sort-Object Property -Descending |
    Select-Object -First 1
```

### Store and reuse

```powershell
$Object = Get-Something
$Object.Property
```

### Array and loop

```powershell
$Items = @("A", "B")

foreach ($Item in $Items) {
    # Use the current item.
}
```
