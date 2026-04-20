# Používatelia

Definície používateľských účtov v `system/modules/users.nix`.

<<< @/../system/modules/users.nix

## Účty

Dva normálne používateľské účty sú definované:

| Používateľ |                   Skupiny |                                        Účel |
| ---------: | ------------------------: | ------------------------------------------: |
|    `kolby` | `wheel`, `networkmanager` | Hlavný používateľ, prevádzkuje Home Manager |
|     `mato` | `wheel`, `networkmanager` |                       Sekundárny používateľ |

Oba účty sú v skupine `wheel`, čo dáva prístup k `sudo`. Skupina `networkmanager` umožňuje spravovať sieťové pripojenia bez `sudo`.

::: info
Heslá nie sú deklarované v Nix konfigurácii. Nastavte ich pomocou `passwd <username>` po prvom rebuild.
:::

::: tip
[All users.users options](https://search.nixos.org/options?channel=25.05&query=users.users)
:::
