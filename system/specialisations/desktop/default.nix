{ lib, ... }:
{
  system.nixos.tags = [ "desktop" ];

  specialisation = {
    desktop.configuration = {
      imports = [ ./modules ];
    };
  };
}
