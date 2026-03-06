{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = true;
      modesetting.enable = true;
      powerManagement.enable = true;

      prime = {
        amdgpuBusId = "PCI:6@0:0:0";
        nvidiaBusId = "PCI:1@0:0:0";
      };
    };
  };
}
