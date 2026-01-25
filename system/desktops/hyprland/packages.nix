{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
    swayidle
    swaylock-effects
    wlogout
    wl-clipboard
    lxqt.pcmanfm-qt
    nwg-displays
    hyprshot
    hyprpaper
    vscode
    libnotify

    # Terminal
    kitty
    starship

    inputs.caelestia-shell.packages.${pkgs.system}.default
    inputs.caelestia-cli.packages.${pkgs.system}.default
  ];
}