{ pkgs, ... }:

{
  system.activationScripts.update-grub-menu = {
    text = ''
      GRUB_CFG="/boot/grub/grub.cfg"

      if [ -f "$GRUB_CFG" ]; then
        ${pkgs.gnused}/bin/sed -i \
          -e 's/menuentry "NixOS - (legion-docked[^"]*)"  {/menuentry "NixOS - Legion Docked" --class nixos {/' \
          -e 's/menuentry "NixOS - (legion-on-the-go[^"]*)"  {/menuentry "NixOS - Legion On The Go" --class nixos {/' \
          "$GRUB_CFG"
      else
        echo "Error: GRUB configuration file not found at $GRUB_CFG"
      fi
    '';
  };
}
