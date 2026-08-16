# PKI Cheatsheet

## Core Terms

- PKI: certificates, keys, certification authorities, policies and trust processes.
- CA: issues and signs certificates according to policy.
- Root CA: top-level trust anchor whose certificate is self-signed.
- Issuing CA: handles routine certificate issuance beneath a root CA.
- Certificate: binds identity information to a public key and is signed by a CA.
- Private key: secret key retained and protected by its owner.
- Public key: distributable part of the key pair.
- Template: Active Directory policy for certificate requests and issuance.
- EKU: Enhanced Key Usage describing permitted certificate purposes.
- CRL: CA-signed Certificate Revocation List.
- CDP: CRL Distribution Point from which clients retrieve revocation information.
- AIA: Authority Information Access location used to find issuer certificates.
- Revocation: invalidation of a certificate before its expiry date.

## Lab Trust Path

```text
CLIENT01 certificate
        |
        v
ANUDIA-ROOT-CA
        |
        v
Trusted Root store
```

Typical two-tier design:

```text
End certificate -> Online issuing CA -> Offline root CA
```

## Lab Configuration

```text
Domain:   ad.anudia.co.uk
Server:   SRV01
CA:       ANUDIA-ROOT-CA
Type:     Enterprise root CA
Client:   CLIENT01
Template: ANUDIA Workstation Authentication
```

## Root and Issuing CAs

Root CA:

- Acts as the trust anchor.
- Has a self-signed certificate.
- Holds an exceptionally sensitive private key.
- Is often kept offline in stronger designs.

Issuing CA:

- Sits below the root CA.
- Handles routine certificate requests.
- Is normally online and available to clients.

## Enterprise and Standalone CAs

Enterprise CA:

- Integrates with Active Directory.
- Uses certificate templates.
- Applies Active Directory enrollment permissions.
- Supports domain enrollment and autoenrollment scenarios.

Standalone CA:

- Does not use the same AD-integrated template model.
- Can be suitable for an offline root role.

## Template Permissions

```text
Domain Computers
Read       Allow
Enroll     Allow
Write      Not required
Autoenroll Disabled during manual testing
```

For narrower deployment, use a dedicated security group instead of all domain computers.

## Certificate Stores

- `Cert:\LocalMachine\My`: Local Computer Personal store.
- `Cert:\LocalMachine\Root`: Local Computer Trusted Root store.

## Certificate Lifecycle

```text
Template -> Request -> Issue -> Use -> Renew or expire
                        |
                        v
                  Key compromise
                        |
                        v
                      Revoke
                        |
                        v
                    Publish CRL
```

## AIA and CDP

- AIA helps clients locate issuer CA certificates.
- CDP tells clients where to retrieve certificate revocation lists.
- A published CRL is useful only if clients can retrieve the location referenced by the certificate.
- Configure stable AIA and CDP locations before issuing certificates widely.

## Security Reminders

- Protect private keys and never commit them to Git.
- Restrict CA administration and template modification permissions.
- Use the narrowest enrollment group and EKUs required for the use case.
- Prefer custom templates over editing built-in templates.
- Revoke compromised certificates and publish current revocation information.
- Back up the CA database, private key and configuration to protected storage.
- Do not describe an online one-tier root CA as equivalent to an offline-root hierarchy.

## Troubleshooting Path

```text
Role -> CertSvc -> CA certificate -> Template -> Permissions
     -> Enrollment -> Private key -> Chain -> AIA and CDP -> CRL
```

## Facts to Remember

- A certificate existing does not prove that it is trusted.
- A successful enrollment does not prove that revocation checking works.
- The certificate holder normally retains its own private key.
- An enterprise CA must publish a template before it can issue from it.
- Read and Enroll support manual enrollment.
- Autoenrollment is a separate template and Group Policy decision.
- Root CA certificates are self-signed, but end certificates are not.
- This lab's one-tier design is intentionally simplified.
