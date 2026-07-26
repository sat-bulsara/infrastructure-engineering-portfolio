# Build 02: Deploy and Configure Windows Server 2025

## The plan

I started this build with a Dell PowerEdge T150 and no working Windows Server installation.

The plan sounded fairly straightforward: get Windows Server 2025 installed, configure the machine properly and get it onto my network.

There was quite a bit to do before I got anywhere near Windows.

I had to sort out the physical disks, configure RAID, get iDRAC working and decide how I was actually going to install the OS. I originally expected to do the installation remotely through iDRAC, but that wasn't the route I ended up taking.

Then the USB installer caused its own problem.

Once Windows was finally running, I still had networking and DNS to sort out.

So this ended up being much more than an OS installation, which was probably a good thing. I finished with a physical Windows Server 2025 machine called `SRV01`, running on my home network and ready for the next part of my infrastructure lab.

---

## Lab environment

| | |
|---|---|
| Server | Dell PowerEdge T150 |
| Operating system | Windows Server 2025 Standard Evaluation |
| Server name | `SRV01` |
| Storage | RAID 1 |
| Available Windows installation disk | ~3.6 TB |
| Server IPv4 address | `192.168.1.250/24` |
| Default gateway | `192.168.1.254` |
| Server management | Dell iDRAC |
| Main computer used during setup | MacBook Pro |
| Installation media | FAT32 USB |
| Tools used | Server Manager, PowerShell, macOS Terminal, Homebrew, wimlib |

I've left passwords, service tags, serial numbers and anything else I wouldn't want sitting in a public repository out of this write-up.

---

## Getting the hardware ready

I started by checking the server and its disks.

The storage was configured as RAID 1, giving me mirrored storage rather than treating the drives as separate disks.

When I eventually reached Windows Setup, the RAID controller presented this as a single disk of roughly 3.6 TB.

I also spent some time getting iDRAC working.

This wasn't completely smooth. At one point I could ping the iDRAC address from my Mac, but the web interface wouldn't load. Oddly enough, it worked from my phone.

That at least told me iDRAC itself was alive.

After trying different browsers and working through the connection problem, I eventually got into it using Safari.

My original idea was to mount the Windows Server ISO through iDRAC and install the OS remotely. I spent some time looking through the Lifecycle Controller and Virtual Media options before deciding that a physical USB installer was going to be the easier route.

So I changed the plan.

I still came away from this part with iDRAC working, which means I now have a way of managing the physical server independently of Windows.

---

## Making the Windows Server USB

This is where I hit one of the more interesting problems.

I had a 32 GB USB drive and the Windows Server 2025 evaluation ISO on my Mac.

The USB was FAT32.

First I checked which disk macOS had assigned to it:

```bash
diskutil list
```

It appeared as `/dev/disk4`.

I formatted it:

```bash
diskutil eraseDisk MS-DOS "WIN2025" GPT /dev/disk4
```

Then mounted the Windows Server ISO:

```bash
hdiutil mount ~/Downloads/26100.32230.260111-0550.lt_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso
```

That gave me:

```text
/Volumes/SSS_X64FREE_EN-US_DV9
```

At this point I thought it would just be a case of copying the installation files onto the USB.

It wasn't.

### The FAT32 problem

The USB had more than enough free space, but the copy still failed.

I checked the Windows image:

```bash
ls -lh /Volumes/SSS_X64FREE_EN-US_DV9/sources/install.wim
```

`install.wim` was about 6.8 GB.

That was the problem.

FAT32 has an individual file-size limit of roughly 4 GB. The USB wasn't too small at all. One file was simply too large for the filesystem.

Once I'd worked that out, the fix was actually quite simple.

I installed `wimlib` through Homebrew:

```bash
brew install wimlib
```

Then split the original WIM:

```bash
wimlib-imagex split \
"/Volumes/SSS_X64FREE_EN-US_DV9/sources/install.wim" \
"/Volumes/WIN2025/sources/install.swm" \
3800
```

I checked the result:

```bash
ls -lh /Volumes/WIN2025/sources/install*.swm
```

and now had:

```text
install.swm     3.7 GB
install2.swm    3.0 GB
```

Both were small enough for FAT32.

That fixed the USB.

I liked this problem because my first assumption was that something was wrong with the USB itself. There wasn't. It was one file and one filesystem limit.

---

## Installing Windows Server

With the USB sorted, I plugged it into the PowerEdge and booted from it.

Compared with what I'd been trying through iDRAC, this bit was easy.

Windows Setup gave me four editions:

```text
Windows Server 2025 Standard Evaluation
Windows Server 2025 Standard Evaluation (Desktop Experience)
Windows Server 2025 Datacenter Evaluation
Windows Server 2025 Datacenter Evaluation (Desktop Experience)
```

I went with:

```text
Windows Server 2025 Standard Evaluation (Desktop Experience)
```

I'm still learning Windows Server administration, so having the GUI available makes more sense for this stage than jumping straight into Server Core.

[View screenshot: Windows Server 2025 edition selection](screenshots/IMG_7178.jpg)

### Choosing the disk

Windows Setup could see the 3.6 TB virtual disk created by the RAID controller:

```text
Disk 0 Unallocated Space    3.6 TB
```

It could also see the `WIN2025` USB as Disk 1.

[View screenshot: Windows Server installation disk selection](screenshots/IMG_7179.jpg)

I selected Disk 0 and let Windows create the partitions it needed.

After the installation finished and the server restarted, I created the local Administrator password and logged in.

---

## First login

Server Manager opened after the first login.

At this point the machine was basically a fresh standalone Windows Server.

[View screenshot: Server Manager after the first login](screenshots/IMG_7180.jpg)

Windows also immediately started suggesting Windows Admin Center and Azure Arc.

[View screenshot: Windows Admin Center and Azure Arc prompt](screenshots/IMG_7181.jpg)

I left Azure Arc alone.

I'll get to that later in the project when I've actually built enough local infrastructure for connecting it to Azure to mean something.

For now I wanted to understand the server in front of me.

---

## What did Windows configure by default?

Before changing much, I opened:

```text
Server Manager
→ Local Server
```

The machine still had its automatically generated Windows name and was a member of:

```text
WORKGROUP
```

Remote Desktop was disabled and Windows Defender Firewall was running.

[View screenshot: Initial Local Server configuration](screenshots/IMG_7182.jpg)

I wanted to see this before changing everything because otherwise I'd have no real idea what Windows Server had configured for me and what I'd configured myself.

---

## Getting Windows onto the network

This caught me out.

Windows showed several network interfaces:

```text
Embedded NIC 1
Embedded NIC 2
Ethernet
```

[View screenshot: Windows Server network interfaces](screenshots/IMG_7184.jpg)

The embedded NICs showed their network cables as unplugged.

I eventually realised why.

I'd plugged the Ethernet cable into the dedicated iDRAC port.

That gave **iDRAC** a network connection. It didn't give **Windows Server** one.

I moved the cable to Embedded NIC 1 and Windows got connectivity.

This is one of those things that seems obvious once you've done it, but it made the separation between iDRAC and the operating system much clearer to me.

The server effectively has a management side and an OS side, and they aren't the same thing.

---

## Looking at the network properly

Once the cable was in the right place, I used:

```powershell
ipconfig /all
```

to see what Windows had actually picked up.

[View screenshot: Initial ipconfig investigation](screenshots/IMG_7185.jpg)

DHCP gave Embedded NIC 1 an address on my LAN.

[View screenshot: Embedded NIC 1 network configuration](screenshots/IMG_7189.jpg)

My network was:

```text
192.168.1.0/24
```

with:

```text
192.168.1.254
```

as the default gateway.

DHCP was useful for getting the server online, but I didn't want to leave an infrastructure server with an address that could change.

I configured:

```text
IP address:      192.168.1.250
Subnet mask:     255.255.255.0
Default gateway: 192.168.1.254
```

`SRV01` now had a predictable address on the network.

---

## Internet worked. DNS didn't.

This was the next problem.

Microsoft websites were timing out, but I could ping:

```powershell
ping 8.8.8.8
```

That changed what I was looking for.

If `8.8.8.8` was replying, the server clearly had more than just a working cable. It could get outside my local network.

So I stopped treating it as a general connectivity problem and started looking at DNS.

[View screenshot: IPv4 and DNS configuration](screenshots/IMG_7191.jpg)

I used `8.8.8.8` partly because it's a known external address. If I could reach it without relying on a hostname, I could test Internet connectivity separately from name resolution.

I also used Google's public DNS while troubleshooting.

That isn't where I want the final Active Directory environment to end up. Once I'm running AD-integrated DNS, domain machines will need to use the internal DNS service rather than pointing straight at public DNS.

For this build, though, I was trying to work out what was broken.

---

## Testing each part

I started close to the server and worked outwards.

First, the gateway:

```powershell
ping 192.168.1.254
```

Result:

```text
Sent = 4
Received = 4
Lost = 0
```

[View screenshot: Successful default gateway test](screenshots/IMG_7194.jpg)

So communication on the local network was fine.

Then:

```powershell
ping 8.8.8.8
```

Again:

```text
Sent = 4
Received = 4
Lost = 0
```

So I had a route out to the Internet.

Finally:

```powershell
nslookup microsoft.com
```

This resolved successfully.

[View screenshot: Internet and DNS tests working](screenshots/IMG_7196.jpg)

This was probably the point where the troubleshooting approach started to click for me.

If the gateway responds, move further out.

If an external IP responds, don't go back and start messing with the cable again.

If an IP works but a hostname doesn't, DNS is a much better place to look.

It sounds basic written down like that, but actually working through it on a physical server made it stick.

---

## Renaming the server

Windows had given the machine one of its generated computer names during installation.

I changed it to:

```text
SRV01
```

Nothing clever. I just wanted a simple, predictable name that would still make sense when I start adding more machines to the lab.

The rename needed a restart.

After it came back up, I checked it from PowerShell:

```powershell
hostname
```

Result:

```text
SRV01
```

[View screenshot: SRV01 hostname verification](screenshots/IMG_7198.jpg)

---

## The display problem can wait

The server is still running at a fairly low display resolution.

Device Manager shows:

```text
Microsoft Basic Display Adapter
```

I checked the hardware ID while looking into it, so I have a decent idea why the resolution options are limited.

Then I stopped.

The server was working. Networking was working. DNS was working. The display driver wasn't preventing me from doing the lab.

It would have been very easy to spend another hour disappearing into that problem for no real benefit.

I'll fix it separately.

---

## My first network share

I was still taking quite a few screenshots with my phone at this point, which was getting annoying.

Now that `SRV01` had a working network connection, I decided to use the network instead.

I created:

```text
C:\LabScreenshots
```

and shared it as:

```text
LabScreenshots
```

Then, from my Mac, I connected to:

```text
smb://192.168.1.250/LabScreenshots
```

[View screenshot: LabScreenshots SMB share opened from macOS](screenshots/Screenshot%202026-07-26%20at%2021.00.49.png)

And there it was in Finder.

This was my first Windows network share.

It's a small thing compared with the rest of the server build, but I liked this bit. I'd gone from taking photos of the server screen with my phone to actually using the server to move the screenshots across my network.

For now I'm authenticating with the local Administrator account.

I don't want to keep doing that. Once I start building Active Directory, I'll be able to come back to this with proper users, groups and permissions.

---

## Current state

The server finished the build as:

```text
Hostname:         SRV01
OS:               Windows Server 2025
IPv4 address:     192.168.1.250/24
Default gateway:  192.168.1.254
Storage:          RAID 1
Windows NIC:      Embedded NIC 1
Internet:         Working
DNS:              Working
SMB:              Working
iDRAC:            Working
```

There are still things I can improve, particularly the display driver and eventually the way I'm authenticating to the SMB share.

But the server itself is up, named, networked and usable.

---

## Things that didn't go to plan

Looking back, these were probably the most useful parts of the whole build.

### iDRAC was reachable but wouldn't open

I could ping the iDRAC address, but the page wouldn't load from my Mac.

The fact that it worked from my phone was useful. I knew the controller wasn't simply dead or unreachable.

I eventually got in through Safari.

### I abandoned the original installation plan

I expected to install Windows through iDRAC Virtual Media.

After working through the options available to me, USB was easier.

Rather than keep fighting the original plan, I changed it.

### The USB had enough space, but the ISO still wouldn't copy

This one initially didn't make much sense.

The USB was 32 GB and the ISO was only around 7.6 GB.

The actual problem was the 6.8 GB `install.wim` file and FAT32's roughly 4 GB individual file limit.

`wimlib` solved it.

### I plugged the cable into the wrong network port

iDRAC had a connection.

Windows didn't.

Moving the cable from the dedicated iDRAC port to Embedded NIC 1 sorted that out and gave me a much better understanding of what the management interface is actually doing.

### Internet connectivity and DNS weren't the same problem

I could reach `8.8.8.8` while hostname access was still failing.

That was probably the best networking lesson in this build.

Instead of treating "the Internet isn't working" as one big problem, I could prove which pieces were already working and concentrate on the next one.

### I didn't fix everything

The display driver is still on my list.

That's fine.

It wasn't stopping the server doing what I needed, so I documented it and carried on.

---

## Commands I used

### macOS

Find the USB:

```bash
diskutil list
```

Format it:

```bash
diskutil eraseDisk MS-DOS "WIN2025" GPT /dev/disk4
```

Mount the Windows Server ISO:

```bash
hdiutil mount ~/Downloads/26100.32230.260111-0550.lt_release_svc_refresh_SERVER_EVAL_x64FRE_en-us.iso
```

Check `install.wim`:

```bash
ls -lh /Volumes/SSS_X64FREE_EN-US_DV9/sources/install.wim
```

Install `wimlib`:

```bash
brew install wimlib
```

Split the WIM:

```bash
wimlib-imagex split \
"/Volumes/SSS_X64FREE_EN-US_DV9/sources/install.wim" \
"/Volumes/WIN2025/sources/install.swm" \
3800
```

Check the split files:

```bash
ls -lh /Volumes/WIN2025/sources/install*.swm
```

### Windows Server / PowerShell

Check the network:

```powershell
ipconfig /all
```

Test the gateway:

```powershell
ping 192.168.1.254
```

Test external IP connectivity:

```powershell
ping 8.8.8.8
```

Test DNS:

```powershell
nslookup microsoft.com
```

Check the computer name:

```powershell
hostname
```

---

## What I took from the build

Before starting this, I thought "install Windows Server" would mostly mean installing Windows.

The Windows installation itself ended up being one of the easiest parts.

Most of my time went into everything around it: physical disks, RAID, iDRAC, making the installation media, figuring out the NICs and then getting the network behaving properly.

The two problems I'll probably remember are the FAT32 USB and DNS.

With the USB, I initially saw a failed copy and thought about the drive. Once I checked the actual files, the problem became much more specific.

The networking was similar. "Microsoft.com doesn't work" could have sent me in all sorts of directions. Being able to ping the gateway and then `8.8.8.8` ruled quite a lot out before I touched anything else.

I'm starting to get more comfortable with proving what works before trying to fix what doesn't.

And I now have a physical Windows Server that I built myself rather than a VM somebody else prepared for me.

---

## Next: Build 03

Next I'm going to turn this into an Active Directory environment.

`SRV01` is currently just a standalone Windows Server in a workgroup. The next build is where I'll start adding AD DS, internal DNS, users, groups and a Windows client.

That's where this should start feeling less like one server sitting on my network and more like an actual Windows infrastructure lab.