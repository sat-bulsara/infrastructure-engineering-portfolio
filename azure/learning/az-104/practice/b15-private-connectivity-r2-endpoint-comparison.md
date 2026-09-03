# ML15-01: Service Endpoint vs Private Endpoint

## Skill and Repetition

- Skill: Select and verify private access patterns for Azure Storage
- Roadmap build or project: Project 15, before Project 16
- Repetition level: R2 Variation
- Previous evidence: Built Blob private access with a private endpoint, Private DNS zone and two VNet links
- Target help level: Hint
- Timebox: 35 minutes

## Changed Scenario

A small internal reporting workload needs to access an Azure Storage account from
one trusted application subnet. Compare a storage service endpoint with the
private endpoint pattern used in Project 15. The goal is to select the suitable
design from the requirements, configure only the changed mechanism and prove the
effective network path.

## Decision Defence

- Business outcome and demand: One internal reporting workload needs reliable
  access to one Azure Storage account from one trusted application subnet.
- Constraints: Public DNS resolution is acceptable; a VNet private IP is not
  required; access must be restricted to the trusted subnet; avoid unnecessary
  Private Link cost and DNS complexity.
- Options considered: Storage service endpoint and private endpoint.
- Selected option: Service endpoint because the workload needs subnet-restricted
  Storage access but does not require a private IP or private DNS.
- Rejected option: Private endpoint, which becomes preferable when a private IP,
  disabled public network path, on-premises private reachability or stronger
  data-exfiltration protection is required.
- Scaling and failure behaviour: Additional trusted subnets require explicit
  Storage firewall rules. The service endpoint does not remove reliance on the
  Storage public endpoint or public DNS resolution.

## Retrieval First

Without notes, explain whether a service endpoint gives the storage account a
private IP address inside the VNet.

## Focused Source

- [Azure Virtual Network Integration for Service Network Isolation](https://learn.microsoft.com/en-us/azure/virtual-network/vnet-integration-for-azure-services)

Use the comparison to answer: which design changes DNS resolution to a private
IP, and which design retains the service's public endpoint while extending the
subnet identity?

## Safety and Cost Check

- Confirm the active tenant and subscription without retaining identifiers.
- Use a disposable resource group and a uniquely named Standard LRS storage account.
- Keep anonymous Blob access disabled and do not paste keys, SAS tokens or identifiers.
- A service endpoint itself has no extra charge, but normal storage and data-transfer charges can apply.
- Do not recreate a private endpoint for this comparison unless deliberately approved, because Private Link has billable hourly and data-processing components.
- Remove all temporary resources and verify their absence.

## Security Pre-Mortem

- Administrative and data-plane access: The exercise configured the management
  plane network boundary only; no storage keys, SAS tokens or data-plane role
  assignments were used.
- Required public exposure: The Storage public endpoint remains, but anonymous
  Blob access must remain disabled and the firewall must restrict network access.
- Credential compromise impact: A stolen credential still requires suitable
  data-plane authorisation and, with the firewall defaulting to Deny, a permitted
  network path.
- Blast-radius boundary: The disposable resource group, selected subnet and
  narrowly scoped Storage network rule.
- Detection: Azure CLI read-only evidence retained for the subnet endpoint and
  Storage network rule. Storage diagnostic logging remains outside this short variation.

## Task

Given the reporting workload requirements, choose either a service endpoint or a
private endpoint. Configure the changed design and prove the storage network rule,
subnet service configuration, DNS result and final cleanup.

Success criteria:

- The design choice is explained before deployment.
- The active Azure context and disposable scope are verified.
- The selected subnet and storage network boundary are configured.
- Read-only evidence distinguishes the endpoint type from Project 15.
- No anonymous access, credential exposure or unintended retained resource remains.

## Layered Hints

1. Hint: decide whether the requirement needs a private IP or only subnet-restricted access.
2. Partial: inspect the subnet's `serviceEndpoints` and the storage account's virtual network rules.
3. Full: provide current safe commands only after an attempted construction, then require a changed explanation.

## Verify

Require read-only evidence for:

- active subscription name and state;
- VNet, subnet and address prefix;
- subnet service endpoint configuration;
- storage account default network action and virtual network rules;
- DNS resolution behaviour; and
- resource-group absence after cleanup.

Expected distinction: a service endpoint does not allocate a private endpoint
network interface or change the normal storage DNS name to a VNet private IP.

## Explain and Transfer

- Explain the endpoint choice and its DNS, scope and data-exfiltration implications.
- Reuse the correct private-access pattern during Project 16 storage security.

## Cleanup and Evidence

- Resources removed or intentionally retained: The disposable resource group
  and all contained resources were deleted; `az group exists` returned `false`.
- Public-safe evidence retained: Clean subnet endpoint, Storage firewall and DNS
  results were returned during the exercise; no portfolio publication is required.
- Secrets and identifiers checked: No keys, connection strings or SAS tokens were
  used or retained. Subscription-scoped identifiers remain unsuitable for public evidence.

## Tutor Record

- Outcome: Complete. Service endpoint, subnet-scoped Storage firewall rule,
  unchanged public DNS resolution and final resource-group absence were verified.
- Help used: Hint for command construction, with Full correction for the
  `Microsoft.Storage` namespace and Azure-services firewall bypass.
- What was demonstrated: Created the disposable scope, VNet, `/24` client subnet,
  Storage service endpoint and Standard LRS Storage account; enforced TLS 1.2,
  disabled anonymous Blob access, set the firewall default to Deny, removed the
  Azure-services bypass and allowed only the selected subnet.
- Misconception or weak point: Initially supplied the resource-group name where
  the service namespace was required, and initially selected an NSG rule instead
  of removing the Storage firewall bypass.
- Next variation: ML15-03 one-sided peering break/fix, then ML15-04 private DNS repair
- Next review date: 2026-09-07
