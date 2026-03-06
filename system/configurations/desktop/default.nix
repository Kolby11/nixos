{ lib, ... }:
{
  system.nixos.tags = [ "desktop" ];

  imports = [
    ./hardware-configuration.nix
    ./modules
  ];
}
