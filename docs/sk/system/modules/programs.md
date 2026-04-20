# Programy

Systémová konfigurácia programov v `system/modules/programs.nix`.

<<< @/../system/modules/programs.nix

## XDG desktop portal

Backend `xdg-desktop-portal-gtk` poskytuje file pickery, zdieľanie obrazovky a ďalšiu systémovú integráciu pre Wayland aplikácie.

`xdgOpenUsePortal = true` presmeruje volania `xdg-open` cez portal namiesto priameho volania, čo zaisťuje konzistentné dialógy pri sandboxovaných aplikáciách.

## direnv

[direnv](https://direnv.net/) automaticky aktivuje/deaktivuje premenné prostredia pri vstupe/výstupe z adresára s `.envrc`. `nix-direnv` pridáva Nix integráciu: `use flake` v `.envrc` aktivuje flake's devShell bez potreby `nix develop`.

## nix-ld

`nix-ld` poskytuje dynamic linker shim, ktorý umožňuje spúšťať predkompilované binárky (proprietárne nástroje, stiahnuté exe) ktoré boli linkované proti štandardným FHS cestám. Injectované knižnice pokrývajú najčastejšie závislosti.

|       Knižnica |                                 Prečo |
| -------------: | ------------------------------------: |
| `stdenv.cc.cc` | C++ štandardná knižnica (`libstdc++`) |
|         `zlib` |                             Kompresia |
|      `openssl` |                                   TLS |
|          `icu` |        Unicode (používané .NET, atď.) |

## Fish shell

Fish je povolený systémovo, takže môže byť nastavený ako login shell pre používateľa bez potreby samostatnej inštalácie.

## GnuPG agent

GnuPG agent beží s podporou SSH, čo umožňuje používať GPG kľúče na autentifikáciu SSH spojení.
