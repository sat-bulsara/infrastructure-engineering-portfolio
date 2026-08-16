# PKI Study Guide

## What PKI Does

Public Key Infrastructure combines certificates, cryptographic keys, certification authorities, policy and operational processes to establish digital trust. Common uses include authentication, encryption and digital signatures.

PKI is not only the CA role. It also depends on secure key handling, controlled enrollment, trust distribution, certificate renewal, revocation information and recovery.

## Public and Private Keys

A certificate subject owns a mathematically related key pair:

- The private key is secret and must be protected.
- The public key can be distributed and is included in the certificate.

If the private key is compromised, the certificate can no longer provide reliable proof of identity and may need to be revoked.

## Certificates and Trust

A certificate contains a subject, issuer, public key, serial number, validity dates and permitted purposes. A CA signs that information.

The presence of a certificate does not make it trusted. Windows must be able to build a valid chain to a trusted root and, where required, obtain current revocation information.

## Root and Issuing CAs

The root CA is the top-level trust anchor. Its certificate is self-signed and its private key deserves the strongest protection.

An issuing CA sits below the root and handles routine certificate requests:

```text
Offline root CA
      |
      v
Online issuing CA
      |
      v
Users, computers and services
```

The lab uses a one-tier enterprise root CA that issues directly. This keeps the environment understandable, but an online root on a multi-role domain controller has a larger security and recovery impact.

## Enterprise and Standalone CAs

An enterprise CA integrates with Active Directory. It can issue from certificate templates and apply Active Directory permissions to enrollment.

A standalone CA does not use the same template workflow and is commonly considered for an offline root where normal domain enrollment is unnecessary.

## Certificate Templates

Templates define the rules for certificate requests, including:

- Who can read and enrol
- Subject-name construction
- Key type and key protection
- Validity and renewal periods
- Enhanced Key Usage
- Whether autoenrollment is available

The lab duplicated the built-in Computer template rather than changing the original. This is useful because the custom template can be versioned, restricted or withdrawn without altering a default template used elsewhere.

## Permissions and EKUs

The recorded lab configuration gave `Domain Computers` Read and Enroll access. This supports manual computer enrollment but includes every domain computer.

A more selective rollout would use a dedicated group. The template should also contain only the EKUs needed for its intended use. A client-only authentication certificate does not automatically need Server Authentication.

## Certificate Stores

PowerShell exposes certificate stores through the `Cert:` provider:

- `Cert:\LocalMachine\My`: Local Computer Personal store.
- `Cert:\LocalMachine\Root`: Local Computer Trusted Root store.

The end certificate and its private key belong in the computer's Personal store. The trusted root certificate belongs in the Trusted Root store.

## Enrollment and Autoenrollment

`CLIENT01` used Active Directory Enrollment Policy to request the custom certificate manually. Manual enrollment was tested before considering automatic deployment.

Autoenrollment additionally requires appropriate template permissions and Group Policy. Enabling it broadly before a manual test could issue certificates to more systems than intended.

## Validity and Renewal

Every certificate has `NotBefore` and `NotAfter` values. An issuing CA cannot issue a certificate that remains valid beyond the CA's own validity period.

Validity is only one part of lifecycle planning. The CA renewal date, certificate renewal process and recovery procedure should be recorded as operational tasks.

## Revocation and CRLs

Revocation invalidates a certificate before expiry. Reasons include key compromise, CA compromise, superseded certificates and cessation of operation.

The final evidence shows that the `CLIENT01` test certificate was revoked with the reason `Unspecified`, then a fresh CRL was requested with `certutil -CRL`. This corrects the earlier intention to use Key Compromise and keeps the documentation aligned with the CA record.

```text
Issue -> Compromise -> Revoke -> Publish CRL -> Client retrieves CRL
```

The final step matters. A CRL file on the CA is not enough if clients cannot reach the CDP location in the issued certificate.

## AIA and CDP

- AIA helps clients locate issuer CA certificates needed to build a chain.
- CDP provides locations from which clients can retrieve CRLs.

These locations should be planned before broad certificate issuance because changing them later affects new certificates, while previously issued certificates continue to reference their original locations.

## Private-Key and CA Security

- Do not export private keys unless the use case requires it.
- Mark end-entity keys non-exportable where appropriate.
- Restrict template modification and CA administration rights.
- Protect the root CA private key more strongly than routine end-entity keys.
- Back up the CA database, private key and configuration to protected storage.
- Never commit PFX, P12, private keys, backup passwords or real recovery material to a repository.

## Troubleshooting Questions

1. Is the AD CS role installed?
2. Is `CertSvc` running?
3. Is the expected CA identity and root certificate present?
4. Is the template stored in Active Directory and published on the CA?
5. Does the requester have Read and Enroll?
6. Does the request match the template's subject and key requirements?
7. Is the certificate in the correct store?
8. Does it have the associated private key?
9. Can Windows build the chain?
10. Are AIA and CDP locations reachable?
11. Is the CRL current?
12. Does verification detect a revoked certificate?

## Windows Servicing Lesson

The AD CS role installation timed out while Windows servicing continued in the background. `TiWorker`, `TrustedInstaller`, CBS log activity and the pending-reboot state showed that the operating system was still working.

A controlled restart completed the installation. The important lesson is to investigate Windows servicing state before retrying or interrupting a timed-out role installation.

## Knowledge Check

After this lab, explain these ideas without reading the commands:

- How certificates bind an identity to a public key
- Why private keys must remain protected
- Root and issuing CA responsibilities
- Enterprise and standalone CA differences
- One-tier and two-tier trade-offs
- Trust-chain construction
- Certificate stores
- Templates, permissions and EKUs
- Manual enrollment and autoenrollment
- Validity, renewal and revocation
- AIA and CDP
- Why the lab architecture is useful for learning but unsuitable as a default production design
