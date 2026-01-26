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
    username = "mato";
    homeDirectory = "/home/mato";
    stateVersion = "25.05";
  };
}


