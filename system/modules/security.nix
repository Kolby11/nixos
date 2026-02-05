{ pkgs, ... }: 

{
  security = {
    polkit.enable = true;
    pam.services.sddm.enableGnomeKeyring = true;
  };
}
