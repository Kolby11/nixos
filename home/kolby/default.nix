{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [
    inputs.illogical-flake.homeManagerModules.default
    ./packages.nix
    ./programs.nix
    ./environment.nix
    ./fonts.nix
    ./hypr-local.nix
    ./desktop-profiles
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
