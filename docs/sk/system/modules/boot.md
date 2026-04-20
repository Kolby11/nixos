# Boot

Nakonfigurované v `system/modules/boot.nix`.

<<< @/../system/modules/boot.nix

## GRUB

Bootloader je GRUB s podporou EFI. Kľúčové nastavenia:

| Možnosť | Hodnota | Dôvod |
|---------|---------|-------|
| `device = "nodev"` | Iba EFI mód | Žiadna inštalácia na MBR |
| `efiSupport = true` | EFI boot záznamy | Potrebné pre moderné UEFI systémy |
| `useOSProber = true` | Detekcia iných OS | Automaticky pridá Windows (alebo iný Linux) do boot menu |
| `fsIdentifier = "label"` | Používa labely súborového systému | Čitateľnejšie a stabilnejšie ako UUID v GRUB záznazoch |
| `timeout = 5` | 5 sekundové odpočítavanie | Čas na výber záznamu pred bootovaním predvoleného |

Flake vstup `elegant-grub2-themes` poskytuje vizuálnu tému (mojave, okno, tmavá, 1080p).

Pre Legion notebook sú názvy GRUB záznámov špecializácií prepisované aktivačným skriptom — pozri [Legion](/sk/system/configurations/legion).

## Plymouth

Plymouth poskytuje animovaný splash screen počas bootovania, ktorý skryje výstup jadra. Je povolený s predvolenými nastaveniami.

## Podporované súborové systémy

`ext4` a `ntfs` sú uvedené v `supportedFilesystems` aby jadro zahrulo potrebné moduly do initramfs. Podpora `ntfs` umožňuje čítanie Windows oddielov pri dual-boote.

::: tip
[Všetky možnosti boot.loader.grub](https://search.nixos.org/options?channel=25.05&query=boot.loader.grub)
:::
