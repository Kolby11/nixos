{ config, pkgs, ... }:

{
  services = {
    dbus.enable = true;
    openssh.enable = true;

    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;  # This inverts the scroll direction
      };
    };

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