# PKI Screenshot Evidence Index

The main README embeds five screenshots. The remaining images are retained as supporting evidence and linked where useful.

| File | What it proves | Embedded |
|---|---|---|
| `01-root-ca-self-signed-certificate.png` | Root certificate Subject matches Issuer and the validity is ten years | Yes |
| `02-custom-template-published.png` | Custom template is published and lists Server and Client Authentication purposes | Yes |
| `03-client01-enrollment-success.png` | Enrollment wizard completed successfully on the client | No |
| `04-client01-certificate-private-key.png` | Issuer, validity, thumbprint and associated private key on `CLIENT01` | Yes |
| `05-certificate-chain-and-revocation-check.png` | Chain elements show no error and the initial leaf revocation check passed | No |
| `06-issued-certificate-record.png` | CA issued request ID 3 to `AD\CLIENT01$` from the custom template | No |
| `07-revoked-certificate-unspecified-reason.png` | Request ID 3 is revoked and the reason is `Unspecified` | Yes |
| `08-base-and-delta-crl-published.png` | `certutil -CRL` completed and CRL files received updated timestamps | Yes |
| `09-newest-delta-crl-file.png` | The newest selected file is the delta CRL | No |
| `10-adcs-role-verification.png` | Certification Authority feature is installed | No |
| `11-crl-files-and-timestamps.png` | Base and delta CRL filenames and publication timestamps | No |

## Evidence Boundaries

The screenshots do not prove:

- `CertSvc` start mode
- The custom template's security permissions
- Private-key exportability settings
- A post-revocation verification from `CLIENT01`
- A completed CA backup or recovery test

These remain visible limitations in the main README.
