{ lib, ... }:
{
  system.nixos.tags = [ "legion-on-the-go" ];

  imports = [ ./modules ];
}
