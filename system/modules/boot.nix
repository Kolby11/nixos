{ config, pkgs, lib, ... }:

{
  boot = {
    loader = {
      timeout = 5;

      efi = {
        efiSysMountPoint = "/boot";
      };

      grub = {
        enable = true;
        useOSProber = true;
        copyKernels = true;
        efiInstallAsRemovable = true;
        efiSupport = true;
        fsIdentifier = "label";
        devices = [ "nodev" ];
        gfxmodeEfi = "1920x1080";
        gfxpayloadBios = "keep";
        extraEntries = "
          menuentry 'Reboot' {
            reboot
          }
          menuentry 'Poweroff' {
            halt
          }
        ";
      };
    };

    plymouth = {
      enable = true;
    };

    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ext4" "ntfs" ];
  };
}
