{ ... }: 

{
  imports = [
    ./boot.nix
    ./gaming.nix
    ./hardware.nix
    ./i18n.nix
    ./networking.nix
    ./nixsettings.nix
    ./packages.nix
    ./polkit.nix
    ./programs.nix
    ./remote-desktop
    ./security.nix
    ./services.nix
    ./sound.nix
    ./time.nix
    ./theme.nix
    ./users.nix
    ./virtualisation.nix
  ];
}
