{ config, pkgs, ... }:

{
  users.users = {
    kolby = {
      isNormalUser = true;
      extraGroups = [
      "wheel"
      "networkmanager"
      "docker"
      ];
    };
    mato = {
      isNormalUser = true;
      extraGroups = [ 
      "wheel" 
      "networkmanager"
      ]; 
    };
  };
}
