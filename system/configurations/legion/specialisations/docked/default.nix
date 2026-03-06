{ lib, ... }:
{
  system.nixos.tags = [ "legion-docked" ];

  imports = [ ./modules ];
}
