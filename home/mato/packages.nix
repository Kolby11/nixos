{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
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
    discord

    # Music
    spotify

    # Background
    nitrogen
  ];
}
