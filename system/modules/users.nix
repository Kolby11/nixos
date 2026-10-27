{ config, pkgs, ... }:

{
  users.users = {
    kolby = {
      isNormalUser = true;
      extraGroups = [
      "wheel"
      "networkmanager"
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
