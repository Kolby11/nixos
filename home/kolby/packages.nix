{ pkgs, pkgs-unstable, inputs, ... }:

{
  home.packages = with pkgs; [
    fzf
    fastfetch

    # Editor
    vscode

    # Dev
    cmake
    gcc
    go
    lua
    nodejs_24
    nodePackages.pnpm
    (python3.withPackages (python-pkgs: [
      python-pkgs.pip
      python-pkgs.requests
    ]))
    rustup
    pkgsCross.mingwW64.stdenv.cc 
    pkgsCross.mingwW64.windows.pthreads
    matugen

    firefox
    # Work
    teams-for-linux

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
    vesktop # Discord

    # Music
    spotify
    inputs.kew.packages.${pkgs.system}.default

    # Game development
    godot-mono
    unityhub
    direnv
    dotnet-sdk_9
    dotnet-runtime_9
  ];
}
