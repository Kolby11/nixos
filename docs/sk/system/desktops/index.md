# Desktopové prostredia

Moduly desktopových prostredí sa nachádzajú v `system/desktops/`. Každé desktopové prostredie je samostatný modul, ktorý inštaluje všetko potrebné na systémovej úrovni.

## Štruktúra

Každý desktop adresár má rovnaký vzor:

```
system/desktops/<name>/
├── default.nix    # Importuje všetky sub-moduly
├── packages.nix   # Systémové balíčky potrebné pre tento desktop
├── programs.nix   # NixOS programové voľby (enable flagy, portal konfigurácia)
└── services.nix   # Služby, ktoré tento desktop vyžaduje
```

Niektoré desktopy majú ďalšie súbory (napr. Hyprland má `ii-shell.nix` pre QuickShell konfiguráciu).

## Zapnutie desktopu

Upravte `system/desktops/default.nix`:

<<< @/../system/desktops/default.nix

Odomknite (uncomment) akýkoľvek desktop, ktorý chcete povoliť. Viaceré desktopy môžu byť aktívne súčasne — inštalujú sa paralelne a prihlasovacie rozhranie umožní výber relácie.

## Dostupné desktopy

|                                Desktop |        Stav |      Kompozitor/WM |
| -------------------------------------: | ----------: | -----------------: |
| [Hyprland](/system/desktops/hyprland/) | **Aktívny** | Wayland kompozitor |
|             [i3](/system/desktops/i3/) |   Neaktívny |      X11 tiling WM |
|       [GNOME](/system/desktops/gnome/) |   Neaktívny |       Plný desktop |
