{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    # ./config.nix
    ./git.nix
    ./packages.nix
    ./programs.nix
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
  };
}


