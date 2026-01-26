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
        gfxpayloadBios = "keep";
        extraEntries = ''
          menuentry 'Reboot' {
            reboot
          }
          menuentry 'Poweroff' {
            halt
          }
        '';
      };
      
      # Configure the elegant theme here
      elegant-grub2-theme = {
        enable = true;
        theme = "mojave";
        type = "blur";
        side = "left";
        color = "dark";
        screen = "1080p";
        logo = "system";
      };
    };
    
    plymouth = {
      enable = true;
    };
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ext4" "ntfs" ];
  };
}