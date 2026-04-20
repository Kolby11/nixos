# Boot

Configured in `system/modules/boot.nix`.

<<< @/../system/modules/boot.nix

## GRUB

The bootloader is GRUB with EFI support. Key settings:

| Option | Value | Reason |
|--------|-------|--------|
| `device = "nodev"` | EFI-only mode | No legacy BIOS MBR install |
| `efiSupport = true` | EFI boot entries | Required for modern UEFI systems |
| `useOSProber = true` | Detect other OS | Adds Windows (or other Linux) to boot menu automatically |
| `fsIdentifier = "label"` | Use filesystem labels | More readable and stable than UUIDs in GRUB entries |
| `timeout = 5` | 5 second countdown | Time to select an entry before booting default |
| `gfxpayloadEfi = "keep"` | Preserve EFI resolution | Prevents resolution reset during kernel handoff |

The `elegant-grub2-themes` flake input provides the visual theme (mojave, windowed, dark, 1080p).

For the Legion laptop, GRUB menu entry names for specialisations are rewritten by an activation script — see [Legion](/system/configurations/legion) for details.

## Plymouth

Plymouth provides an animated boot splash screen that masks kernel log output during boot. It is enabled with default settings; no custom Plymouth theme is configured at the system level.

## Supported filesystems

`ext4` and `ntfs` are listed in `supportedFilesystems` so the kernel includes the necessary modules in the initramfs. `ntfs` support is needed to read Windows partitions when dual-booting.

::: tip
[All boot.loader.grub options](https://search.nixos.org/options?channel=25.05&query=boot.loader.grub)
:::
