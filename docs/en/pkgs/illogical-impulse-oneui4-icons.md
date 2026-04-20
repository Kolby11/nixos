# OneUI4 Icons

Custom derivation for the illogical-impulse fork of the OneUI4 icon theme, in `pkgs/illogical-impulse-oneui4-icons/default.nix`.

<<< @/../pkgs/illogical-impulse-oneui4-icons/default.nix

## What it installs

The derivation fetches `end-4/OneUI4-Icons` from GitHub and installs three icon theme variants to `$out/share/icons/`:

| Theme | Inherits from | Use |
|-------|--------------|-----|
| `OneUI` | `Papirus`, `Adwaita`, `hicolor` | Default |
| `OneUI-dark` | `Papirus-Dark`, `Adwaita`, `hicolor` | Dark mode |
| `OneUI-light` | `Papirus-Light`, `Adwaita`, `hicolor` | Light mode |

## Patches applied

The source has several issues that must be fixed before installation:

| Patch | Reason |
|-------|--------|
| Remove broken symlinks (`find -xtype l -delete`) | Dead symlinks in the source cause `cp` to fail |
| Remove `icon-theme.cache` files | Stale cache files prevent proper icon theme resolution; the system regenerates them |
| Fix `Inherits=` in `index.theme` | Sets correct parent themes for each variant for proper icon fallback |
| Fix duplicate `[16@2x/devices]` section | A copy-paste error in the source; line 285–289 should define `[22@2x/devices]` |
| Add missing directory sections | Several icon directories listed in `index.theme` lack matching `[section]` definitions, which causes GTK icon loading warnings |

## Usage

This icon theme is installed system-wide in `system/desktops/hyprland/ii-shell.nix` as part of the `iconThemes` list. QuickShell searches `XDG_DATA_DIRS` for icon themes, and `ii-shell.nix` injects the theme's `share/` path into that variable via the wrapper script.
