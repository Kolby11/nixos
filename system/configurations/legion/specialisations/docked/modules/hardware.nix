{ lib, ... }:
{
  # In docked / PRIME-sync mode Nvidia drives all outputs; AMD iGPU still
  # available as a secondary render device.
  environment.sessionVariables = {
    AQ_DRM_DEVICES = lib.mkForce "/dev/dri/nvidia-dgpu:/dev/dri/amd-igpu";
    WLR_DRM_DEVICES = lib.mkForce "/dev/dri/nvidia-dgpu";
    __GLX_VENDOR_LIBRARY_NAME = lib.mkForce "nvidia";
  };

  environment.etc."xdg/uwsm/env-hyprland".text = lib.mkForce ''
    export AQ_DRM_DEVICES=/dev/dri/nvidia-dgpu:/dev/dri/amd-igpu
    export WLR_DRM_DEVICES=/dev/dri/nvidia-dgpu
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
  '';

  hardware.nvidia = {
    powerManagement.finegrained = lib.mkForce false;

    prime = {
      offload.enable = lib.mkForce false;
      offload.enableOffloadCmd = lib.mkForce false;
      sync.enable = true;
    };
  };
}
