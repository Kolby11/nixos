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
        starship.enable = true;
      };
    };
  };

  home.packages = [
    (lib.hiPrio quickshellSystemShimWithAliases)
    pkgs.opencode
  ];

  home.file = {
    ".local/state/quickshell/.venv/pyvenv.cfg".force = true;
    ".local/state/quickshell/.venv/bin/activate".force = true;
    ".local/state/quickshell/.venv/bin/python".force = true;
    ".local/state/quickshell/.venv/bin/python3".force = true;
  };

}
