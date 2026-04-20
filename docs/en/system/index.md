# System Configuration

The root system configuration is `system/configuration.nix`:

<<< @/../system/configuration.nix

It has three concerns:

- **`./modules`** — shared system-level configuration (boot, networking, sound, users, etc.)
- **`./desktops`** — desktop environment modules that are currently active
- **`./configurations`** — per-device hardware overrides selected by the `device` argument from the flake

`system.stateVersion` is set to `"25.05"` and should not be changed after initial install — it controls stateful defaults for services that NixOS manages on your behalf.
