# System Modules

All shared system configuration lives under `system/modules/`. Every module is imported via `system/modules/default.nix`:

<<< @/../system/modules/default.nix

## Module overview

| Module | Purpose |
|--------|---------|
| `boot.nix` | GRUB bootloader and Plymouth splash screen |
| `gaming.nix` | Adds the nix-gaming binary cache for gaming packages |
| `hardware.nix` | Base hardware support: Bluetooth, graphics (32-bit) |
| `i18n.nix` | System locale and supported languages |
| `networking.nix` | NetworkManager, hostname, IPv6 |
| `nixsettings.nix` | Nix daemon settings, flakes, garbage collection |
| `packages.nix` | Base system packages available to all users |
| `polkit.nix` | GNOME Polkit authentication agent as a systemd user service |
| `programs.nix` | direnv, nix-ld, fish, GnuPG, XDG portal |
| `remote-desktop/` | RustDesk and WayVNC (both currently disabled) |
| `security.nix` | Polkit enable, PAM keyring unlock |
| `services.nix` | SDDM display manager and supporting services |
| `sound.nix` | PipeWire audio stack |
| `theme/` | SDDM greenleaf visual theme |
| `time.nix` | System timezone |
| `users.nix` | User account definitions |
