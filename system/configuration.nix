{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./desktops
    ./specialisations
  ];

  system.stateVersion = "25.05"; 
}

