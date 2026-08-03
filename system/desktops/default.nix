{ config, lib, pkgs, ... }:

{
  imports = [
    # ./i3
    ./hyprland
    ./kde
    ./niri
    # ./gnome
  ];
}
