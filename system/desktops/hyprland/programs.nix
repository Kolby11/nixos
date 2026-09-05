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
      # UWSM should identify the compositor as Hyprland.  Using the
      # start-hyprland wrapper here makes it export
      # XDG_CURRENT_DESKTOP=start-hyprland, which triggers Hyprland's warning
      # about an externally managed desktop environment.
      binPath = lib.mkForce "/run/current-system/sw/bin/Hyprland";
    };
  };
}
