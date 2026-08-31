# Hyper-V Study Guide

## Hyper-V

Hyper-V is Microsoft's hypervisor technology. It allows a physical Windows host to provide virtual hardware to multiple isolated virtual machines.

```text
Physical Host
    |
 Hyper-V
    |
    +-- VM
    +-- VM
    +-- VM
```

## Host vs Guest

**Host:** physical machine running Hyper-V.

**Guest:** operating system running inside a virtual machine.

In this project:

```text
Host  = SRV01
Guest = DC01
```

`SRV01` is also the existing domain controller and certificate authority in
this learning environment. Combining those roles with Hyper-V keeps the home
lab compact, but it also increases the impact of a host failure or compromise.
A production design would normally separate these responsibilities.

## Virtual Switches

### External

Provides connectivity through a physical network adapter.

### Internal

Allows communication between the host and VMs connected to the switch.

### Private

Allows communication between connected VMs but not the Hyper-V host.

Memory aid:

```text
External = outside network
Internal = host + VMs
Private  = VMs only
```

## Internal Switch vs NAT

An Internal switch does not automatically provide Internet access.

Windows NAT can be added separately so an internal subnet can route outbound through the host.

## VHDX

VHDX is the modern Hyper-V virtual hard disk format.

A **dynamically expanding** VHDX grows as data is written, up to its configured maximum.

A **fixed** VHDX reserves its configured capacity immediately.

## Generation 1 vs Generation 2

Generation 1 uses an older virtual hardware model.

Generation 2 uses UEFI and supports features such as Secure Boot. It is normally the appropriate choice for modern Windows guests.

## Dynamic Memory

Dynamic Memory lets Hyper-V adjust the amount of memory assigned to a VM within configured limits.

Startup memory is therefore not necessarily the amount of RAM continuously assigned.

## APIPA

Windows may self-assign an address in:

```text
169.254.0.0/16
```

when a NIC is operational but DHCP is unavailable.

This can be useful troubleshooting evidence.

## Secure Boot

Secure Boot verifies trusted boot components before an operating system starts.

Generation 2 Hyper-V VMs support Secure Boot.

It is enabled by default for Generation 2 Windows guests. If it is disabled to
diagnose installation media, record the change, verify whether it is still
required, re-enable it when supported and test the guest boot again.

## Checkpoints

A checkpoint allows a VM to return to an earlier state.

### Production Checkpoint

Uses guest-aware mechanisms such as VSS for Windows workloads.

The `Production` setting can fall back to a standard checkpoint if creating a
production checkpoint fails. `ProductionOnly` prevents that fallback when an
application-consistent checkpoint is required.

### Standard Checkpoint

Captures VM runtime state.

Important:

```text
Checkpoint != Backup
```

Checkpoints are useful for short-term rollback, not long-term recovery.

## Networking Troubleshooting Order

```text
1. Is the VM running?
2. Does it have a virtual NIC?
3. Is the NIC attached to the correct switch?
4. Does the guest have the correct IP/subnet?
5. Is routing/gateway configuration required?
6. Is DNS correct?
7. Is Windows Firewall allowing the traffic?
8. Is the required service/application running?
```

## What to Remember

At this stage you should be able to explain:

- Hypervisor, host and guest
- External vs Internal vs Private switches
- Internal switch vs NAT
- VHDX
- Dynamic vs fixed virtual disks
- Generation 1 vs Generation 2
- Dynamic Memory
- APIPA
- Secure Boot
- Production checkpoints
- Production versus ProductionOnly behaviour
- Why checkpoints are not backups
- Basic Hyper-V PowerShell administration
- Layered VM connectivity troubleshooting
- Why a multi-role Hyper-V host increases blast radius
