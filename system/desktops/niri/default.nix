{ config, lib, pkgs, ... }:

lib.mkIf config.local.features.niriDesktop {
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    alacritty
    fuzzel
  ];
}
