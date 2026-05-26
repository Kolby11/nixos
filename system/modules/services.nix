{ config, pkgs, ... }:

{
  services = {
    dbus.enable = true;
    openssh.enable = true;
    geoclue2.enable = true;  # For QtPositioning
    upower.enable = true; # For battery status
    udisks2.enable = true; # For external storage in Nautilus
    power-profiles-daemon.enable = true; # CPU/platform power management


    # Keyring
    gnome.gnome-keyring.enable = true;

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
        theme = "greenleaf";
        package = pkgs.kdePackages.sddm;
      };
      defaultSession = "hyprland-uwsm";
    };

    xserver = {
      enable = true;
    };
  };
}