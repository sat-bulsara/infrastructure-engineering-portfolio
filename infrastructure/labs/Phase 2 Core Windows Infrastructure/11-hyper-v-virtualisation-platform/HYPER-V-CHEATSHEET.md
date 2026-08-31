# Hyper-V Cheatsheet

## Host / Guest

```text
Host  = physical Hyper-V server
Guest = OS inside a VM
```

## Switch Types

| Type | VM ↔ VM | VM ↔ Host | Physical LAN |
|---|---|---|---|
| External | Yes | Yes* | Yes |
| Internal | Yes | Yes | No by itself |
| Private | Yes | No | No |

`*` when management OS sharing is enabled.

## Memory Aid

```text
External = outside
Internal = host + VMs
Private  = VMs only
```

## Project Network

```text
SRV01 physical:       192.168.1.250
Physical gateway:     192.168.1.254

HV-LAB-INTERNAL host: 10.10.10.1/24
DC01:                 10.10.10.10/24
```

## VHDX

Modern Hyper-V virtual disk format.

```text
Dynamic = grows as required
Fixed   = reserves full size
```

## VM Generations

```text
Gen 1 = legacy/BIOS-style
Gen 2 = UEFI + Secure Boot support
```

## APIPA

```text
169.254.x.x
```

Often means the NIC is working but DHCP is unavailable.

## Checkpoints

```text
Production = guest-aware
ProductionOnly = guest-aware with no standard fallback
Standard   = runtime state
```

**Checkpoint != backup**

## Troubleshooting

```text
VM
↓
Virtual NIC
↓
vSwitch
↓
IP/subnet
↓
Gateway/routes
↓
DNS
↓
Firewall
↓
Service
```

## Key Rules

- Verify GUI changes with PowerShell.
- Know whether PowerShell is running on the host or guest.
- Do not disable Windows Firewall just to make testing work.
- Keep lab workloads isolated where practical.
- Prefer VHDX and Generation 2 for modern Windows guests.
- Treat Secure Boot disablement as a temporary, recorded troubleshooting step.
- Treat checkpoints as short-term rollback, not backups.
- Separate hypervisor, domain controller and certificate authority roles in a
  stronger production design.
