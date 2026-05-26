{ lib, ... }:
{
  hardware.nvidia = {
    powerManagement.finegrained = lib.mkForce false;

    prime = {
      offload.enable = lib.mkForce false;
      offload.enableOffloadCmd = lib.mkForce false;
      sync.enable = true;
    };
  };
}
