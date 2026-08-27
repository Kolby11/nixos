{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    waybar
    wlogout
    wl-clipboard
    lxqt.pcmanfm-qt
    nwg-displays
    hyprshot
    hyprpaper
    hyprshade
    libnotify
    inotify-tools
    slurp
    hyprpicker
    grim

    # Terminal
    kitty

    lm_sensors

    kdePackages.syntax-highlighting
    kdePackages.kdialog

  ];
}
