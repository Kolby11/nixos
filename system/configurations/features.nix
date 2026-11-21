{ lib, device, ... }:

let
  # Manage optional features for each machine here.
  hosts = {
    desktop = {
      virtualMachines = true;
      docker = true;
      plasmaDesktop = true;
      niriDesktop = true;
    };
    legion = {
      virtualMachines = false;
      docker = true;
      plasmaDesktop = false;
      niriDesktop = false;
    };
    hp = {
      virtualMachines = false;
      docker = true;
      plasmaDesktop = true;
      niriDesktop = true;
    };
  };
in
{
  options.local.features = {
    virtualMachines = lib.mkEnableOption "KVM/QEMU virtual machines, TPM emulation, and virt-manager";
    docker = lib.mkEnableOption "Docker containers";
    plasmaDesktop = lib.mkEnableOption "the KDE Plasma desktop session";
    niriDesktop = lib.mkEnableOption "the Niri desktop session";
  };

  config.local.features = hosts.${device};
}
