{ pkgs, pkgs-unstable, inputs, lib, ... }:

{
  home.packages = with pkgs; [
    # Essentials
    fzf
    matugen
    tmatrix
    cliphist
    wl-clipboard

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
    nodePackages.pnpm
    (lib.hiPrio python3)
    (lib.lowPrio kdePackages.breeze-icons)
    rustup
    pkgsCross.mingwW64.stdenv.cc 
    pkgsCross.mingwW64.windows.pthreads
    dotnet-sdk_9
    dotnet-runtime_9

    # AI
    claude-code

    # Browser
    firefox

    # Communication
    teams-for-linux
    vesktop # Discord client

    # Bluetooth
    blueberry

    # Gaming
    steam
    steam-run
    (lutris.override {
      extraPkgs = pkgs: [
        wineWowPackages.stable
        winetricks
      ];
    })

    # Drawing
    krita

    # 3D Modeling
    blender

    # Music
    spotify
    inputs.kew.packages.${pkgs.system}.default

    # ii shell Python dependencies
    (python3.withPackages (ps: with ps; [
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
    ]))

    # Game development
    unityhub
    godot-mono
  ];
}
