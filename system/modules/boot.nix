{ config, pkgs, lib, ... }:
{
  boot = {
    initrd.kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    loader = {
      timeout = 5;
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        useOSProber = true;
        fsIdentifier = "label";

        gfxpayloadEfi = "keep";
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
    tmp.cleanOnBoot = true;
    supportedFilesystems = [ "ext4" "ntfs" ];
    plymouth = {
      enable = true;
    };
  };
}