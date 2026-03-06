{ config, pkgs, ... }:

{
  hardware = {
    # Bluetooth support
    bluetooth.enable = true;

    # Graphics
    graphics = {
      enable = true;
      enable32Bit = true;  # Required for Steam/Wine
    };
  };
}
