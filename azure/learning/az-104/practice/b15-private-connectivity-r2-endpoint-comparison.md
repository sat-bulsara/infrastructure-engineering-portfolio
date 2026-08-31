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

- Resources removed or intentionally retained: Pending
- Public-safe evidence retained: Pending
- Secrets and identifiers checked: Pending

## Tutor Record

- Outcome: Pending
- Help used: Pending
- What was demonstrated: Pending
- Misconception or weak point: Pending
- Next variation: ML15-03 one-sided peering break/fix, then ML15-04 private DNS repair
- Next review date: Pending
