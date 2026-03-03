{ pkgs, pkgs-unstable, inputs, ... }:

{
  home.packages = with pkgs; [
    # Essentials
    fzf
    matugen
    tmatrix

    # Editor
    vscode-fhs

    # Dev
    cmake
    gnumake
    gcc
    go
    lua
    nodejs_24
    nodePackages.pnpm
    (python3.withPackages (python-pkgs: [
      python-pkgs.pip
    ]))
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

    # Game development
    direnv
    unityhub
    godot-mono
  ];
}
