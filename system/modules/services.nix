{ config, pkgs, ... }:

{
  services = {
    dbus.enable = true;
    openssh.enable = true;

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-mocha";
        package = pkgs.kdePackages.sddm;
      };
      defaultSession = "hyprland";
    };

    xserver = {
      enable = true;
    };
  };
}