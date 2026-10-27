{ pkgs, pkgs-unstable, inputs, lib, ... }:

let
  # The illogical-flake Home Manager module wraps Quickshell with Home Manager's
  # Qt packages. Keep user-session launches on the system wrapper, where
  # Quickshell and Qt imports come from the same nixpkgs input.
  quickshellSystemShim = pkgs.writeShellScriptBin "qs" ''
    exec /run/current-system/sw/bin/qs "$@"
  '';

  quickshellSystemShimWithAliases = pkgs.runCommand "quickshell-system-shim" { } ''
    mkdir -p $out/bin
    ln -s ${quickshellSystemShim}/bin/qs $out/bin/qs
    ln -s ${quickshellSystemShim}/bin/qs $out/bin/quickshell
  '';
in
{
  # illogical-flake adds its own Quickshell build even though launches use
  # the system shim below. Avoid building that unused copy (and mixing Qt
  # versions), while retaining the module's other packages and Qt settings.
  options.home.packages = lib.mkOption {
    apply = builtins.filter (package: (package.name or "") != "quickshell-with-qtpositioning");
  };

  config = {
    programs = {
      home-manager.enable = true;
      yazi = {
        enable = true;
        package = pkgs-unstable.yazi.override {
          _7zz = pkgs-unstable._7zz-rar;
        };
      };
      illogical-impulse = {
        enable = true;
        dotfiles = {
          fish.enable = false;
          kitty.enable = false;
          starship.enable = false;
        };
      };
    };

    home.packages = [
      (lib.hiPrio quickshellSystemShimWithAliases)
      pkgs.opencode
    ];

    systemd.user.services.hyprmoncfgd = {
      Unit = {
        Description = "Hyprland monitor profile daemon";
        After = "graphical-session.target";
      };
      Service = {
        ExecStart = "${pkgs-unstable.hyprmoncfg}/bin/hyprmoncfgd";
        Restart = "on-failure";
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
    };

    home.file = {
      ".local/state/quickshell/.venv/pyvenv.cfg".force = true;
      ".local/state/quickshell/.venv/bin/activate".force = true;
      ".local/state/quickshell/.venv/bin/python".force = true;
      ".local/state/quickshell/.venv/bin/python3".force = true;
    };
  };
}
