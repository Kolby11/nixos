# Desktop Environments

Desktop environment modules live under `system/desktops/`. Each desktop is a self-contained module that installs everything it needs to function at the system level.

## Structure

Each desktop directory follows the same pattern:

```
system/desktops/<name>/
├── default.nix    # Imports all sub-modules
├── packages.nix   # System packages this desktop needs
├── programs.nix   # NixOS program options (enable flags, portal config)
└── services.nix   # Any services this desktop requires
```

Some desktops have additional files (e.g., Hyprland's `ii-shell.nix` for the QuickShell configuration).

## Enabling a desktop

Edit `system/desktops/default.nix`:

<<< @/../system/desktops/default.nix

Uncomment any desktop to enable it. Multiple desktops can be active simultaneously — they install alongside each other and the login screen lets you choose which session to start.

## Available desktops

| Desktop | Status | Compositor/WM |
|---------|--------|--------------|
| [Hyprland](/system/desktops/hyprland/) | **Active** | Wayland compositor |
| [i3](/system/desktops/i3/) | Inactive | X11 tiling WM |
| [GNOME](/system/desktops/gnome/) | Inactive | Full desktop |
