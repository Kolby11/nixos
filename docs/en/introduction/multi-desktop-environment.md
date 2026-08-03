# Multi-Desktop Environment

The configuration supports multiple desktop environments from a single NixOS installation. Each desktop is an independent module under `system/desktops/` and can be toggled via a single import change.

## Active desktops

`system/desktops/default.nix` controls which desktops are built into the system:

<<< @/../system/desktops/default.nix

Hyprland, Niri, and KDE Plasma are enabled together. SDDM lets the same user choose a desktop at login.

## Per-desktop system config

Each desktop module (`system/desktops/<name>/`) declares everything that desktop needs at the system level:

- **packages** — tools the WM/compositor depends on (bars, launchers, screenshot tools, etc.)
- **programs** — NixOS program options (e.g., `programs.hyprland.enable`)
- **services** — any systemd or display server services the desktop requires

The base system modules (networking, sound, boot, etc.) are shared — desktops only add what is desktop-specific on top.

## Per-desktop home config

User-level configuration is managed in Home Manager. SDDM exposes one entry for each desktop environment: Hyprland, Niri, and Plasma. KDE visual profiles are not separate login sessions.

Breeze and Frutiger Aero are available after logging into Plasma under **System Settings > Colors & Themes > Global Theme**. Breeze comes with Plasma; the Frutiger Aero module installs its Global Theme, color scheme, icons, and supporting Plasma packages. New KDE visual profiles belong under `system/desktops/kde/profiles/` and should install a Plasma Global Theme rather than a display-manager session.

## Available desktop environments

| Desktop | Status | Notes |
|---------|--------|-------|
| Hyprland | **Active** | Wayland compositor with QuickShell (ii-shell) |
| i3 | Inactive | X11 tiling window manager with Polybar |
| GNOME | Inactive | Full desktop environment |
| KDE | **Active** | Plasma 6 with Breeze and Frutiger Aero Global Themes |
