{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
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
  };
}


