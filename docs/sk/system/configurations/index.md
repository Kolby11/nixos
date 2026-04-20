# Konfigurácie strojov

Každé fyzické zariadenie má svoj adresár v `system/configurations/`. Zariadenie na zostavenie sa vyberá počas evaluácie flaku cez argument `device`.

## Ako to funguje

`flake.nix` definuje pomocníka `mkSystem`:

<<< @/../flake.nix{26-35 nix}

Každá položka v `nixosConfigurations` volá `mkSystem` s názvom zariadenia. Ten reťazec sa prenáša ako `specialArgs.device` až na:

<<< @/../system/configurations/default.nix

`lib.optionals (device == "desktop") [ ./desktop ]` podmienečne importuje adresár zariadenia len pri zostavovaní pre dané zariadenie. To znamená, že sa nikdy nevyhodnocujú konfigurácie iných zariadení.

## Štruktúra adresára pre zariadenie

```
system/configurations/<device>/
├── default.nix               # Importuje hardware-configuration.nix + ./modules
├── hardware-configuration.nix  # Generované pomocou nixos-generate-config
└── modules/
    ├── default.nix           # Importuje moduly špecifické pre zariadenie
    └── hardware.nix          # GPU ovládače a nastavenia zariadenia
```

## Dostupné stroje

| Zariadenie |                                                              Popis |
| ---------: | -----------------------------------------------------------------: |
|  `desktop` |                                                     AMD desktop PC |
|   `legion` | Lenovo Legion laptop (AMD + NVIDIA hybrid GPU, so specializáciami) |

## Pridanie nového stroja

Spustite `./setup` a vyberte **"Create new configuration"**. Pozrite [Setup](/setup/) pre kompletný návod.
