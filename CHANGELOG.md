# GT-N8010 / GT-N8013 changelog

## 2026-11-24 — VFP kernel preview

- Add the upstream ARM VFP hotplug fix to clear the cached hardware owner when a CPU goes offline.
- The matching Boot-only test completed one long suspend/wake cycle with 12 h 18 min of cumulative suspend, unchanged core process IDs, SELinux Enforcing and an empty crash buffer on the tested hardware.
- The signed full-ROM preview keeps the November 22 Android build identity. The complete ZIP passed host checks. Device validation used the same kernel installed through Boot only.
- ROM SHA-256 `197a30164d36ee26648dac447423078549db984851aae894a1c2034a6c56779d`. [Manual preview for GT-N8010 / GT-N8013](https://github.com/html6405/android_device_samsung_n8010/releases/tag/lineage-23.2-20261124-vfp-preview)

## 2026-11-22 — LineageOS 23.2 experimental

Built and package-verified. TWRP installation and first Enforcing boot passed;
bounded runtime results are recorded below. Welcome/network setup appeared and Wi-Fi
connected. No account was added during setup. Camera capture and media checks are described below.

- Update Android16/LineageOS23.2 Wi-Fi-only product configuration, current HAL declarations and model identity.
- Use a dedicated N8010 kernel configuration with modem/HSIC/Phonet paths disabled and Enforcing boot token. Memory-history diagnostics remain disabled; existing KernelSU/full-UID-check configuration is unchanged.
- Include shared Exynos4 AVC, Codec2/audio, GLES2/WebView and legacy ION compatibility changes. HEVC decoders remain temporarily unadvertised.
- Retain service-local Broadcom GPS compatibility preload and add GPS reset GPIO permissions.
- Retain the original dock keyboard lifecycle. Experimental hotplug/wake changes are excluded; automatic software-keyboard fallback and dock wake stability remain unresolved.

Bounded N8010 tests: Wi-Fi external ping2/2; both cameras produced frames/new JPEGs;
1080p28.034-second video saved with hardware AVC/AAC encoding. Reference chess
video remained visibly rendered after seek inputs; hardware AVC/Codec2 AAC
playback confirmed. Bluetooth reached ON without a captured crash, then returned
to its original OFF state. These do not establish acoustic quality, paired audio,
full visual quality or precise seek latency. Own-recording playback remains only
partially verified. An unplugged sleep/wake returned on the same boot with Wi-Fi and 93% battery;
about 1 h 56 min cumulative suspend was accounted for in a 2 h 27 min window
including streaming. The user reported Prime opening without an observed crash.
Logs nevertheless captured an auto-restarted ueventd ReadUevent+156 crash. This
shared unresolved issue prevents a crash-free stability claim. GPS, physical
S Pen/sensors and overnight sleep remain pending. Full Enforcing validation and inherited neverallow/KernelSU
security limits remain open. GApps/microG and Vanilla OTA addon survival are unverified.

Artifact: `lineage-23.2-20261122-HTML6405-n8010-otafix.zip`,668733483bytes,incremental1795348601.
SHA-256: `c7a87b5f955eaefa933cc3c70de16875f251993e8cd65f9723041d66c4cc8ed7`.

- Correct the OTA backup-script prerequisite handling. The final package is newly
  signed with recalculated/verified metadata offsets; boot and all System/Vendor
  payloads remain byte-identical to the installed firmware. This is an installer
  correction, not a new firmware build. Two-OTA/addon preservation remains untested.
