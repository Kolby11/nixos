{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
  ];

  environment.systemPackages = [ pkgs.efibootmgr ];

  # Keep a firmware fallback if the named NixOS UEFI entry is lost.
  boot.loader.grub.extraInstallCommands = let
    esp = lib.escapeShellArg config.boot.loader.efi.efiSysMountPoint;
  in ''
    legion_esp=${esp}
    if [ -f "$legion_esp/EFI/BOOT/BOOTX64.EFI" ] && [ ! -e "$legion_esp/EFI/BOOT/BOOTX64.EFI.before-nixos" ]; then
      ${pkgs.coreutils}/bin/cp "$legion_esp/EFI/BOOT/BOOTX64.EFI" "$legion_esp/EFI/BOOT/BOOTX64.EFI.before-nixos"
    fi
    ${pkgs.coreutils}/bin/install -D -m 0644 \
      "$legion_esp/EFI/NixOS-boot/grubx64.efi" \
      "$legion_esp/EFI/BOOT/BOOTX64.EFI"
  '';
}
