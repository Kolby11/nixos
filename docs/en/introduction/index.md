# Introduction

Hi, I'm [Kolby11](https://kollarmartin.com), a passionate software developer. This site documents my [NixOS](https://nixos.org/) multi-desktop environment configuration.

The configuration manages two machines — a desktop PC and a Lenovo Legion laptop — sharing a common module base, with per-device hardware overrides. The laptop additionally uses NixOS *specialisations* to switch between GPU modes at boot.

## Repository layout

```
nixos/
├── flake.nix                     # Flake inputs and system/home-manager definitions
├── system/
│   ├── configuration.nix         # Root system config (imports modules, desktops, device config)
│   ├── modules/                  # Shared system modules (boot, networking, sound, …)
│   ├── desktops/                 # Desktop environment configs (Hyprland, i3, GNOME)
│   └── configurations/           # Per-device hardware overrides (desktop, legion)
├── home/kolby/                   # Home Manager config for user kolby
├── pkgs/                         # Custom Nix package derivations
├── setup                         # Interactive device setup script
└── rebuild                       # Shortcut rebuild script
```

## Flake inputs

| Input | Channel / Source | Purpose |
|-------|-----------------|---------|
| `nixpkgs` | `nixos-25.05` | Stable system packages |
| `nixpkgs-unstable` | `nixos-unstable` | Newer packages (QuickShell, etc.) |
| `home-manager` | `release-25.05` | User environment management |
| `elegant-grub2-themes` | Custom fork | GRUB visual theme |
| `kew` | Custom fork | Terminal music player |
| `spicetify` | `Gerg-L/spicetify-nix` | Spotify theming |
| `claude-code` | `sadjow/claude-code-nix` | Claude Code CLI |
| `yazi` | `sxyazi/yazi` | Terminal file manager |
| `quickshell` | `outfoxxed/quickshell` | QML-based shell (ii-shell) |

## License

See the [LICENSE](/LICENSE.md).
