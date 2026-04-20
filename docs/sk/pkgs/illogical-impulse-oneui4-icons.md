# OneUI4 Ikony

Vlastná derivácia pre fork `illogical-impulse` ikonovej témy OneUI4, nachádza sa v `pkgs/illogical-impulse-oneui4-icons/default.nix`.

<<< @/../pkgs/illogical-impulse-oneui4-icons/default.nix

## Čo inštaluje

Derivácia stiahne `end-4/OneUI4-Icons` z GitHubu a nainštaluje tri varianty ikonovej témy do `$out/share/icons/`:

| Téma          |                             Dedičí od |     Použitie |
| ------------- | ------------------------------------: | -----------: |
| `OneUI`       |       `Papirus`, `Adwaita`, `hicolor` |   Predvolená |
| `OneUI-dark`  |  `Papirus-Dark`, `Adwaita`, `hicolor` |  Tmavý režim |
| `OneUI-light` | `Papirus-Light`, `Adwaita`, `hicolor` | Svetlý režim |

## Aplikované záplaty

Zdroj obsahuje niekoľko problémov, ktoré je potrebné opraviť pred inštaláciou:

|                                                   Záplata |                                                                                                                   Dôvod |
| --------------------------------------------------------: | ----------------------------------------------------------------------------------------------------------------------: |
| Odstránenie zlomených symlinkov (`find -xtype l -delete`) |                                                                                  Mŕtve symlinky spôsobujú zlyhanie `cp` |
|                    Odstránenie `icon-theme.cache` súborov |                                       Zastaralé cache zabraňujú správnemu riešeniu ikonových tém; systém ich regeneruje |
|                        Oprava `Inherits=` v `index.theme` |                                                Nastaví správne rodičovské témy pre každý variant, aby fallback fungoval |
|               Oprava duplicitnej sekcie `[16@2x/devices]` |                                                    Chyba copy-paste; riadky 285–289 by mali definovať `[22@2x/devices]` |
|                     Pridanie chýbajúcich sekcií adresárov | Niektoré adresáre uvedené v `index.theme` nemali zodpovedajúce sekcie, čo spôsobovalo varovania pri načítaní ikon v GTK |

## Použitie

Túto ikonovú tému inštalujeme systémovo v `system/desktops/hyprland/ii-shell.nix` ako súčasť zoznamu `iconThemes`. QuickShell vyhľadáva `XDG_DATA_DIRS` pre ikonové témy a `ii-shell.nix` pridáva cestu `share/` tejto témy do tejto premennej cez wrapper skript.
