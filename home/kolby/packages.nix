{ pkgs, pkgs-unstable, inputs, lib, ... }:

let
  customPkgs = import ../../pkgs { inherit pkgs; };
in
{
  home.packages = with pkgs-unstable; [
    # Essentials
    fzf
    (lib.lowPrio matugen)
    tmatrix
    (lib.lowPrio cliphist)
    (lib.lowPrio wl-clipboard)

    # Editor
    vscode-fhs

    # Dev
    cmake
    ninja
    gnumake
    gcc
    go
    lua
    nodejs_24
    pnpm
    (lib.hiPrio python3)
    (lib.lowPrio kdePackages.breeze-icons)
    rustup
    pkgsCross.mingwW64.stdenv.cc 
    pkgsCross.mingwW64.windows.pthreads
    dotnet-sdk_9
    cloc

    # AI
    customPkgs.claude-code
    inputs.codex-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.codex-desktop-linux.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Browser
    firefox

    # Communication
    teams-for-linux
    vesktop # Discord client

    # Bluetooth
    blueman

    # Gaming
    steam
    steam-run
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        wineWow64Packages.stable
        winetricks
      ];
    })

    # Drawing
    krita

    # 3D Modeling
    blender

    # Music
    spotify
    inputs.kew.packages.${pkgs.stdenv.hostPlatform.system}.default

    # ii shell Python dependencies
    (lib.lowPrio (python3.withPackages (ps: with ps; [
      dbus-python
      materialyoucolor
      material-color-utilities
      pywayland
      psutil
      pygobject3
      pycairo
      setproctitle
      numpy
      pillow
      tqdm
      loguru
    ])))

    # Game development
    unityhub
    godot-mono
  ];
}
