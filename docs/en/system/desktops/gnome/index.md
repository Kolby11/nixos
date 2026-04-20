# GNOME

GNOME desktop environment support lives under `system/desktops/gnome/`. It is currently **inactive** — uncomment `./gnome` in `system/desktops/default.nix` to enable it.

## Services

<<< @/../system/desktops/gnome/services.nix

`xserver.desktopManager.gnome.enable = true` enables the full GNOME desktop.

The three `gnome.*` options disable the default GNOME application suite:
- `core-apps.enable = false` — removes Nautilus, Evince, GNOME Text Editor, etc.
- `core-developer-tools.enable = false` — removes GNOME Builder and related tools
- `games.enable = false` — removes GNOME Games

This leaves just the GNOME Shell, Mutter compositor, and system settings, without the bundled applications.

## Programs

<<< @/../system/desktops/gnome/programs.nix

No additional program options are currently configured.

## Packages

<<< @/../system/desktops/gnome/packages.nix

`gnome-tour` and `gnome-user-docs` are excluded from the system to avoid the first-run tour dialog and reduce closure size.
