{ config, lib, pkgs, ... }:

let
  cfg = config.desktopProfiles.kde;
  enabledProfiles = lib.filterAttrs (_: profile: profile.enable) cfg.profiles;

  # Plasma Workspace ships both Wayland and legacy X11 session files. Keep the
  # Wayland session so SDDM presents one KDE choice alongside the other desktops.
  visibleSessions = pkgs.runCommand "desktop-sessions" {
    preferLocalBuild = true;
    allowSubstitutes = false;
  } ''
    mkdir -p "$out/share/wayland-sessions" "$out/share/xsessions"

    ${lib.concatMapStrings (package: ''
      if test -d ${package}/share/wayland-sessions; then
        ${pkgs.buildPackages.xorg.lndir}/bin/lndir \
          ${package}/share/wayland-sessions "$out/share/wayland-sessions"
      fi
      if test -d ${package}/share/xsessions; then
        ${pkgs.buildPackages.xorg.lndir}/bin/lndir \
          ${package}/share/xsessions "$out/share/xsessions"
      fi
    '') config.services.displayManager.sessionPackages}

    rm -f "$out/share/xsessions/plasmax11.desktop"
  '';
in
{
  imports = [
    ./profiles/breeze.nix
    ./profiles/frutiger-aero.nix
  ];

  options.desktopProfiles.kde = {
    enable = lib.mkEnableOption "KDE Plasma with profiles available as Global Themes";

    profiles = lib.mkOption {
      default = { };
      description = ''
        Plasma profiles installed inside KDE. These must not create additional
        display-manager sessions; visual profiles belong in Global Themes.
      '';
      type = lib.types.attrsOf (lib.types.submodule ({ name, ... }: {
        options = {
          enable = lib.mkEnableOption "the ${name} Plasma profile" // {
            default = true;
          };
          packages = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [ ];
            description = "Packages and Plasma modules required by this profile.";
          };
        };
      }));
    };
  };

  config = lib.mkMerge [
    { desktopProfiles.kde.enable = true; }
    (lib.mkIf cfg.enable {
      services.desktopManager.plasma6.enable = true;
      services.displayManager.sddm.settings = {
        Wayland.SessionDir = lib.mkForce "${visibleSessions}/share/wayland-sessions";
        X11.SessionDir = lib.mkForce "${visibleSessions}/share/xsessions";
      };
      environment.systemPackages = lib.concatMap (profile: profile.packages) (lib.attrValues enabledProfiles);
    })
  ];
}
