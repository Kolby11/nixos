# Téma

SDDM vizuálna téma v `system/modules/theme/sddm.nix`.

<<< @/../system/modules/theme/sddm.nix

## Greenleaf téma

[Sddm-greenleaf-theme](https://github.com/kamack38/sddm-greenleaf-theme) je prírodou inšpirovaná SDDM prihlasovacia téma. Je stiahnutá z GitHubu a nainštalovaná ako Nix derivácia, takže nie je potrebné manuálne kopírovanie súborov.

Téma vyžaduje tieto Qt runtime balíčky (inštalované cez `extraPackages`):

|                     Balíček |                                Prečo |
| --------------------------: | -----------------------------------: |
|     `kdePackages.qt5compat` | Qt5 kompatibilita používaná QML témy |
| `kdePackages.qtdeclarative` |                           QML engine |
|         `kdePackages.qtsvg` |      SVG rendrovanie pre assets témy |

JetBrains Mono Nerd Font je nainštalovaný systémovo, aby SDDM prihlasovací obraz mohol vykresliť font ešte pred načítaním používateľských fontov.

::: info
`services.displayManager.sddm.theme` je nastavené na `"greenleaf"` v `services.nix`. Tento modul iba inštaluje balík témy a jeho závislosti.
:::
