# Basic Principles

## System vs. Home Manager split

The NixOS **system configuration** (`system/`) installs and enables everything a desktop environment needs to function: the window manager or compositor, display manager, session management, and all supporting programs each desktop relies on — status bars, launchers, file managers, clipboard daemons, notification daemons.

**Home Manager** (`home/`) handles all user-level configuration: dotfiles, user packages, shell setup, fonts, and themes. Home Manager config is designed to be **desktop-specific** — a separate user or module set should exist for each desktop environment so that per-desktop tooling does not bleed into other environments.

## Why this separation?

- **No duplication**: the system declares what is available; Home Manager declares how it is configured. Changing a program's config only touches Home Manager.
- **Isolation**: enabling or disabling a whole desktop environment is a single import toggle in `system/desktops/default.nix`.
- **Portability**: Home Manager config travels with the user identity, not with the machine.
- **Reproducibility**: every package and every config value is declared in Nix — no manual installs, no configuration drift.

## Multi-machine support

The flake defines a `mkSystem` helper that takes a `device` argument:

```nix
mkSystem = device: lib.nixosSystem {
  inherit system;
  modules = [ ./system/configuration.nix ... ];
  specialArgs = { inherit inputs device; };
};
```

Each machine (`desktop`, `legion`) gets its own entry in `nixosConfigurations`. The `device` string flows through `system/configurations/default.nix` to select the correct per-device hardware overrides. This means a single `flake.nix` manages all machines with no code duplication in the shared modules.

## Flake channels

Two nixpkgs channels are pinned simultaneously:

- `nixpkgs` (`nixos-25.05`) — used for stable system packages and Home Manager
- `nixpkgs-unstable` — used for packages that require newer versions, specifically `quickshell` and the Qt 6 packages it depends on

The unstable packages are passed to modules via `pkgs-unstable` in `specialArgs`.
