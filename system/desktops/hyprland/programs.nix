{ config, pkgs, pkgs-unstable, lib, ... }:

{
  programs = {
    hyprland = {
      enable = true;
      withUWSM = true;
      package = pkgs-unstable.hyprland;
      portalPackage = pkgs-unstable.callPackage ../../../pkgs/xdg-desktop-portal-hyprland {
        # 1.5.0 needs the workspace-capture protocol from hyprland-protocols 0.8.0.
        hyprland-protocols = pkgs-unstable.hyprland-protocols.overrideAttrs (old: rec {
          version = "0.8.0";
          src = pkgs-unstable.fetchFromGitHub {
            owner = "hyprwm";
            repo = "hyprland-protocols";
            tag = "v${version}";
            hash = "sha256-g09dB6NCTzD4F6YgYrGXRhUfG52xwxUtlMAbHvv/1gE=";
          };
          nativeBuildInputs = [ pkgs-unstable.cmake ];
        });
      };
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
