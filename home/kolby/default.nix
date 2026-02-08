{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    # ./config.nix
    ./packages.nix
    ./programs.nix
    ./environment.nix
    ./fonts.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

  home = {
    username = "kolby";
    homeDirectory = "/home/kolby";
    stateVersion = "25.05";

    pointerCursor = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 18;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}


