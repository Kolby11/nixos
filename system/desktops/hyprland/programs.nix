{ config, pkgs, pkgs-unstable, lib, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      package = pkgs-unstable.hyprland;
      portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
    };
    hyprlock.enable = true;
    uwsm.waylandCompositors.hyprland = {
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
      binPath = lib.mkForce "/run/current-system/sw/bin/start-hyprland";
    };
  };
}
