{ config, lib, pkgs, ... }:

{
  virtualisation = {
    libvirtd = lib.mkIf config.local.features.virtualMachines {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
        swtpm.enable = true;
      };
    };

    docker = lib.mkIf config.local.features.docker {
      enable = true;
      package = pkgs.docker_29;
    };
  };

  programs.virt-manager.enable = config.local.features.virtualMachines;
  users.users.kolby.extraGroups =
    lib.optionals config.local.features.virtualMachines [ "libvirtd" "kvm" ]
    ++ lib.optionals config.local.features.docker [ "docker" ];
}
