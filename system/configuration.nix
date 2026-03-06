{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules
    ./desktops
    ./configurations
  ];

  system.stateVersion = "25.05"; 
}

