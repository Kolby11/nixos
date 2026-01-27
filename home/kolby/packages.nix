{ pkgs, pkgs-unstable, ... }:

{
  home.packages = with pkgs; [
    (pkgs.callPackage ./wallrizz.nix {})
    fzf
    fastfetch
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
  ];
}
