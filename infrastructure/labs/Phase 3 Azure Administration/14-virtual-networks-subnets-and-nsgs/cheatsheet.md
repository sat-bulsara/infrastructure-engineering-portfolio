# Cheatsheet: Azure networking foundations

## Addressing

- VNet `10.20.0.0/16`; web `10.20.1.0/24`; app `10.20.2.0/24`; management `10.20.3.0/24`
- Azure reserves five addresses in each subnet, so a `/24` has 251 usable addresses.

## NSGs

- Lower priority numbers run first, and the first match wins.
- NSGs are stateful, so return traffic for an allowed flow is normally permitted.
- Defaults allow virtual-network and Azure load-balancer traffic, allow outbound Internet, then deny unmatched traffic.
- Subnet and NIC NSGs are both evaluated. Both must allow the traffic.
- Application security groups can represent workload membership instead of hard-coded addresses.

## Terraform loop

`terraform fmt` -> `init` -> `validate` -> `plan` -> review -> `apply` -> verify -> destroy.
