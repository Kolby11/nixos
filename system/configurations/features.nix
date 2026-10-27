{ lib, device, ... }:

let
  # Manage optional features for each machine here.
  hosts = {
    desktop = {
      virtualMachines = true;
      docker = true;
    };
    legion = {
      virtualMachines = false;
      docker = true;
    };
    hp = {
      virtualMachines = false;
      docker = true;
    };
  };
in
{
  options.local.features = {
    virtualMachines = lib.mkEnableOption "KVM/QEMU virtual machines, TPM emulation, and virt-manager";
    docker = lib.mkEnableOption "Docker containers";
  };

  config.local.features = hosts.${device};
}
