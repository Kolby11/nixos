{ lib, pkgs, ... }:

{
  imports = [
    ./profiles/breeze.nix
    ./profiles/frutiger-aero.nix
  ];

  home.activation.seedKdeDesktopProfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    templates="$HOME/.local/share/desktop-profile-templates/kde"
    profiles="$HOME/.config/desktop-profiles/kde"

    if [ -d "$templates" ]; then
      for template in "$templates"/*; do
        [ -d "$template" ] || continue
        profile="$profiles/$(basename "$template")"
        $DRY_RUN_CMD mkdir -p "$profile"

        while IFS= read -r -d "" source; do
          relative="''${source#$template/}"
          target="$profile/$relative"
          if [ ! -e "$target" ]; then
            $DRY_RUN_CMD mkdir -p "$(dirname "$target")"
            $DRY_RUN_CMD ${pkgs.coreutils}/bin/cp -L --preserve=mode "$source" "$target"
          fi
        done < <(find -L "$template" -type f -print0)
      done
    fi
  '';
}
