# Samsung Galaxy Note 10.1 Wi-Fi — GT-N8010

Device configuration for unofficial LineageOS 23.2 / Android 16.
The [2026-11-22 experimental Enforcing release](https://github.com/html6405/android_device_samsung_n8010/releases/tag/lineage-23.2-20261122) has passed package verification, installation and bounded runtime tests documented below. N8000 hardware results do not establish N8010 compatibility.

## Build

Use the matching local platform forks, `n80xx-common`, `smdk4412-common`,
`kernel/samsung/smdk4412` and proprietary files in `vendor/samsung/n80xx` and
`vendor/samsung/smdk4412-common`. A separate `vendor/samsung/n8010` tree is optional;
the current configuration uses the shared vendor trees.

```sh
source build/envsetup.sh
lunch lineage_n8010-bp4a-userdebug
make -j8 bacon
```

`lineage.dependencies` supplies the dependency filename expected by roomservice.
The older `lineageos.dependencies` is retained for existing tooling.

## Differences from N8000

- Own `lineageos_n8010_defconfig`, based on the current N8000 config with the
  Samsung/XMM6262 modem, HSIC modem link, modem IRQ distribution and Phonet disabled.
  Broadcom GPS, Wi-Fi, Bluetooth and the common Android kernel options remain enabled.
- Wi-Fi-only product, no radio HAL declarations, no RIL packages or cpboot service.
  The common vendor compatibility rules exclude the modem blob for Wi-Fi products.
- Current HAL declarations, display and memory properties follow N8000;
  GPS keeps its service-local preload and receives GPS reset GPIO permissions.
- Existing N8010/N8013 identity and Wi-Fi overlays are retained.

## Partition layout and first validation

This configuration expects 2 GiB SYSTEM and 739241984 bytes CACHE
(about 705 MiB), preserving the previously inspected N8010 layout. It is different
from the current N8000 CACHE layout. The ROM does not repartition the device.
Verify the actual target partition layout and compatible recovery before flashing.
The existing N8013 OTA aliases do not establish validation of that model/layout.

The current candidate passed ZIP/payload integrity, merged VINTF compatibility,
Wi-Fi-only package checks and packed-kernel/config verification. It contains an
Enforcing boot configuration, HEVC-off codec configuration and the original dock
keyboard driver; failed experimental keyboard changes are excluded.

First boot/setup completed with SELinux Enforcing. Wi-Fi returned two external
ping replies. Both cameras produced real frames and new photos; a 28.034-second
1080p AVC/AAC recording was saved. Reference video visibly played after seek
inputs, with Samsung hardware AVC and Codec2 AAC confirmed. Bluetooth enabled
without a captured crash and was restored off; paired audio is untested.

After unplugged sleep, the same boot returned with Wi-Fi connected and 93% battery.
About 1 h 56 min of suspend was accounted for within a 2 h 27 min window that also
included streaming; this is not a standby battery benchmark. The user reported
Prime opening without an observed crash. Independently captured logs contain an
auto-restarted ueventd crash at ReadUevent+156, also previously observed on N8000.
It is unresolved. Listening tests, detailed playback quality, own-recording display
confirmation, GPS, physical S Pen/sensor checks, USB/MTP, overnight sleep and full
Enforcing validation remain pending. Automatic dock/software-keyboard switching remains unresolved.
KernelSU full UID checks remain disabled; this is not a hardened security release.

Release package: `lineage-23.2-20261122-HTML6405-n8010-otafix.zip`, 668733483 bytes,
incremental `1795348601`.
SHA-256: `c7a87b5f955eaefa933cc3c70de16875f251993e8cd65f9723041d66c4cc8ed7`.
See [CHANGELOG.md](CHANGELOG.md) for candidate status. Preserve the existing
LineageOS 21 TWRP backup; candidate installation does not authorize deleting it.

Copyright (C) 2012 The CyanogenMod Project. Licensed under Apache-2.0.

## Optional KernelSU Manager

KernelSU support is included in the kernel.

The manager is optional and linked separately; it is not bundled or uploaded with this ROM. Use [KernelSU v3.3.1 Manager32680 (original upstream APK)](https://github.com/backslashxx/KernelSU/releases/download/v3.3.1/KernelSU_v3.3.1_32680-release.apk), ARM32/armeabi-v7a, UAPI5,12138194bytes. SHA-256: `d3a813af25045ad745bec812bf76005b301e26b85f6b627c9e05c61482c3bc39`. Do not substitute “latest”32736/UAPI6. Existing KernelSU security configuration remains unchanged.

N8010 manager recognition, normal-app root grant and grant persistence have not yet been tested. N8000 results do not validate these on N8010.

## OTA installer correction

The final package retains exactly the installed firmware images and incremental
`1795348601`. Only the OTA backup script was corrected, then the package was
regenerated and signed through the standard metadata/signing flow. Original and
final payloads are byte-identical. Two successive OTA updates and addon survival
have not yet been validated. Vanilla includes neither GApps nor microG. Limited
user reports of separately installed microG working with YouTube/Maps do not
establish complete compatibility or OTA persistence.
