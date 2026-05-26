{ config, pkgs, lib, ... }:

{
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware = {
    nvidia = {
      open = true;
      modesetting.enable = true;

      powerManagement.enable = true;
      powerManagement.finegrained = true;

      prime = {
        amdgpuBusId = "PCI:6@0:0:0";
        nvidiaBusId = "PCI:1@0:0:0";

        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
      };
    };
  };
}
