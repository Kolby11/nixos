# Úvod

Ahoj, som [Kolby11](https://kollarmartin.com), nadšený softvérový vývojár. Táto stránka dokumentuje moju [NixOS](https://nixos.org/) konfiguráciu s viacerými desktopovými prostrediami.

Konfigurácia spravuje dva stroje — stolný počítač a notebook Lenovo Legion — so spoločným základom modulov a per-zariadenie hardvérovými nastaveniami. Notebook navyše využíva NixOS *špecializácie* na prepínanie GPU módov pri bootovaní.

## Štruktúra repozitára

```
nixos/
├── flake.nix                     # Flake vstupy a definície systému/home-manager
├── system/
│   ├── configuration.nix         # Koreňová systémová konfigurácia
│   ├── modules/                  # Zdieľané systémové moduly (boot, sieť, zvuk, …)
│   ├── desktops/                 # Konfigurácie desktopových prostredí (Hyprland, i3, GNOME)
│   └── configurations/           # Hardvérové nastavenia per-zariadenie (desktop, legion)
├── home/kolby/                   # Home Manager konfigurácia pre používateľa kolby
├── pkgs/                         # Vlastné Nix derivácie balíčkov
├── setup                         # Interaktívny skript na nastavenie zariadenia
└── rebuild                       # Skratka na prebudovanie systému
```

## Flake vstupy

| Vstup | Kanál / Zdroj | Účel |
|-------|--------------|------|
| `nixpkgs` | `nixos-25.05` | Stabilné systémové balíčky |
| `nixpkgs-unstable` | `nixos-unstable` | Novšie balíčky (QuickShell, atď.) |
| `home-manager` | `release-25.05` | Správa používateľského prostredia |
| `elegant-grub2-themes` | Vlastný fork | Vizuálna téma GRUBu |
| `kew` | Vlastný fork | Terminálový hudobný prehrávač |
| `spicetify` | `Gerg-L/spicetify-nix` | Tematizácia Spotify |
| `claude-code` | `sadjow/claude-code-nix` | Claude Code CLI |
| `yazi` | `sxyazi/yazi` | Terminálový správca súborov |
| `quickshell` | `outfoxxed/quickshell` | QML shell framework (ii-shell) |

## Licencia

Pozri [LICENCIU](/sk/LICENSE.md).
