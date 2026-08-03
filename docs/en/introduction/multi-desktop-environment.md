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

User-level configuration is managed in Home Manager. The existing `~/.config` remains the Hyprland configuration root. KDE login profiles use isolated roots under `~/.config/desktop-profiles/kde/`, preventing Plasma settings and modules from overwriting the Hyprland setup.

Each enabled KDE profile appears as a separate SDDM session. `Plasma (Breeze profile)` and `Plasma (Frutiger Aero)` therefore share the `kolby` account and user data, but keep independent Plasma layouts and settings.

To add a KDE variant, add matching modules in:

- `system/desktops/kde/profiles/<profile>.nix` for the SDDM entry and profile-specific packages or Plasma modules.
- `home/kolby/desktop-profiles/kde/profiles/<profile>.nix` for that profile's dotfiles.

The system profile module declares `desktopProfiles.kde.profiles.<profile>`. Its generated launcher sets `DESKTOP_PROFILE`, `XDG_CONFIG_HOME`, and an isolated `XDG_CACHE_HOME` before Plasma starts. Other XDG data remains shared, so applications, downloads, and user data are available in every desktop.

Home Manager keeps the declarative defaults in `~/.local/share/desktop-profile-templates/kde/` and seeds files that do not exist in a profile. The resulting files under `~/.config/desktop-profiles/kde/` are writable, so changes made in KDE System Settings remain local to that profile. Delete one profile directory and run Home Manager again to reset it to its declared defaults.

## Available desktop environments

| Desktop | Status | Notes |
|---------|--------|-------|
| Hyprland | **Active** | Wayland compositor with QuickShell (ii-shell) |
| i3 | Inactive | X11 tiling window manager with Polybar |
| GNOME | Inactive | Full desktop environment |
| KDE | **Active** | Plasma 6 with isolated Breeze and Frutiger Aero profiles |
