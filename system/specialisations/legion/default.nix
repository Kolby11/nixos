{ ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./hardware.nix
  ];

  specialisation = {
    legion-docked.configuration = {
      imports = [ ./docked ];
    };
    legion-on-the-go.configuration = {
      imports = [ ./on-the-go ];
    };
  };
}
