{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    oh-my-posh

    lm_sensors

    kdePackages.syntax-highlighting
    kdePackages.kdialog

  ];
}
