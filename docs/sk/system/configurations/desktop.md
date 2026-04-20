# Desktop

Konfigurácia pre AMD desktop PC, nachádza sa v `system/configurations/desktop/`.

## Vstupný bod

<<< @/../system/configurations/desktop/default.nix

`system.nixos.tags = [ "desktop" ]` označuje tento build pre identifikáciu (viditeľné v `nixos-version`).

## Hardvérová konfigurácia

<<< @/../system/configurations/desktop/hardware-configuration.nix

Generované pomocou `nixos-generate-config`. Kľúčové detaily:

- **CPU**: AMD (mikrokód aktualizovaný cez `hardware.cpu.amd.updateMicrocode`)
- **Boot**: EFI partícia na `/boot`, root ext4 na `/`
- **Initramfs moduly**: `nvme`, `xhci_pci`, `ahci`, `usbhid`, `sd_mod`
- **DHCP**: zapnutý na všetkých rozhraniach predvoleně

## Moduly špecifické pre zariadenie

<<< @/../system/configurations/desktop/modules/hardware.nix

Desktop používa výlučne AMD GPU. `services.xserver.videoDrivers = [ "amdgpu" ]` načíta `amdgpu` kernel modul a Mesa userspace driver.

Pre tento stroj nie je potrebná NVIDIA hybridná konfigurácia — tá je špecifická pre [Legion](/system/configurations/legion).
