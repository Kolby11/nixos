{ config, lib, pkgs, ... }:

{
  imports = [
    ./modules
    ./desktops
    ./configurations
  ];

  system.stateVersion = "25.05"; 
}

