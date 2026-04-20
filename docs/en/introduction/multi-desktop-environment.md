# Multi-Desktop Environment

The configuration supports multiple desktop environments from a single NixOS installation. Each desktop is an independent module under `system/desktops/` and can be toggled via a single import change.

## Active desktops

`system/desktops/default.nix` controls which desktops are built into the system:

<<< @/../system/desktops/default.nix

Currently **Hyprland** is the active desktop. Uncomment `./i3` or `./gnome` to enable additional environments alongside it.

## Per-desktop system config

Each desktop module (`system/desktops/<name>/`) declares everything that desktop needs at the system level:

- **packages** — tools the WM/compositor depends on (bars, launchers, screenshot tools, etc.)
- **programs** — NixOS program options (e.g., `programs.hyprland.enable`)
- **services** — any systemd or display server services the desktop requires

The base system modules (networking, sound, boot, etc.) are shared — desktops only add what is desktop-specific on top.

## Per-desktop home config

User-level configuration (dotfiles, theming, per-app settings) is managed in Home Manager. The intent is that each desktop environment has its own Home Manager module so that, for example, a Hyprland user's Waybar config does not coexist with an i3 user's Polybar config.

## Available desktop environments

| Desktop | Status | Notes |
|---------|--------|-------|
| Hyprland | **Active** | Wayland compositor with QuickShell (ii-shell) |
| i3 | Inactive | X11 tiling window manager with Polybar |
| GNOME | Inactive | Full desktop environment |
| KDE | Planned | Not yet configured |
