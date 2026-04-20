# Fonty & Kurzor

Konfigurácia fontov a kurzora v `home/kolby/fonts.nix`.

<<< @/../home/kolby/fonts.nix

## Inštalované fonty

|                          Font |                                                                                                   Účel |
| ----------------------------: | -----------------------------------------------------------------------------------------------------: |
|        `nerd-fonts.fira-code` |                                                 Hlavný monospace font s ligatúrami a Nerd Font ikonami |
|   `nerd-fonts.jetbrains-mono` |                                                                    Alternatívny monospace s ligatúrami |
|      `nerd-fonts.ubuntu-mono` |                                                                                     Náhradný monospace |
| `customPkgs.material-symbols` | Variable ikonový font používaný QuickShell/ii-shell (pozri [Material Symbols](/pkgs/material-symbols)) |

## Fontconfig

`fonts.fontconfig.enable = true` aktivuje fontconfig pre užívateľský profil, takže nainštalované fonty sú objavené aplikáciami.

Predvolené priradenia fontov:

| Kategória |                                                           Font |
| --------: | -------------------------------------------------------------: |
| Monospace | FiraCode Nerd Font Mono → UbuntuMono Nerd Font Mono (fallback) |
|     Emoji |                                             FiraCode Nerd Font |

## Kurzor

Téma kurzora `Bibata-Modern-Classic` je nastavená pre GTK aj X11 relácie:

| Nastavenie |                 Hodnota |
| ---------: | ----------------------: |
|     `name` | `Bibata-Modern-Classic` |
|  `package` |        `bibata-cursors` |
|     `size` |                    `18` |

Obe `gtk.enable` a `x11.enable` sú `true`, takže kurzor platí vo Wayland (GTK) aj X11 reláciách.
