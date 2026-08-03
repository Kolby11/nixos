{ config, lib, pkgs, ... }:

let
  cfg = config.desktopProfiles.kde;
  enabledProfiles = lib.filterAttrs (_: profile: profile.enable) cfg.profiles;

  mkLauncher = profileName: profile:
    pkgs.writeShellScriptBin "start-plasma-${profileName}" ''
      export DESKTOP_PROFILE="kde/${profileName}"
      export XDG_CONFIG_HOME="$HOME/${profile.configHome}"
      export XDG_CACHE_HOME="$HOME/.cache/desktop-profiles/kde/${profileName}"

      mkdir -p "$XDG_CONFIG_HOME" "$XDG_CACHE_HOME"
      exec ${pkgs.kdePackages.plasma-workspace}/bin/startplasma-wayland
    '';

  launchers = lib.mapAttrs mkLauncher enabledProfiles;
  sessionNames = map (name: "plasma-${name}") (lib.attrNames enabledProfiles);

  profileSessions = pkgs.runCommand "plasma-profile-sessions" {
    passthru.providedSessions = sessionNames;
  } ''
    mkdir -p "$out/share/wayland-sessions"
    ${lib.concatStringsSep "\n" (lib.mapAttrsToList (profileName: profile: ''
      cat > "$out/share/wayland-sessions/plasma-${profileName}.desktop" <<EOF
      [Desktop Entry]
      Type=Application
      Name=${profile.displayName}
      Comment=Plasma desktop using the kde/${profileName} configuration profile
      Exec=${launchers.${profileName}}/bin/start-plasma-${profileName}
      TryExec=${launchers.${profileName}}/bin/start-plasma-${profileName}
      DesktopNames=KDE
      EOF
    '') enabledProfiles)}
  '';
in
{
  imports = [
    ./profiles/breeze.nix
    ./profiles/frutiger-aero.nix
  ];

  options.desktopProfiles.kde = {
    enable = lib.mkEnableOption "KDE Plasma with isolated login profiles";

    profiles = lib.mkOption {
      default = { };
      description = ''
        Plasma configurations exposed as separate display-manager sessions.
        Each profile may be extended from its own NixOS module.
      '';
      type = lib.types.attrsOf (lib.types.submodule ({ name, ... }: {
        options = {
          enable = lib.mkEnableOption "the ${name} Plasma profile" // {
            default = true;
          };
          displayName = lib.mkOption {
            type = lib.types.str;
            default = "Plasma (${name})";
          };
          configHome = lib.mkOption {
            type = lib.types.str;
            default = ".config/desktop-profiles/kde/${name}";
            readOnly = true;
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
      services.displayManager.sessionPackages = [ profileSessions ];
      environment.systemPackages = lib.concatMap (profile: profile.packages) (lib.attrValues enabledProfiles);
    })
  ];
}
