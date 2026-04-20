# Prostredie

Konfigurácia session prostredia v `home/kolby/environment.nix`.

<<< @/../home/kolby/environment.nix

## Premenné prostredia

|      Premenná |              Hodnota |                                                                   Účel |
| ------------: | -------------------: | ---------------------------------------------------------------------: |
| `DOTNET_ROOT` | `${pkgs.dotnet-sdk}` | Ukazuje na Nixom nainštalovaný .NET SDK (používané IDE a `dotnet` CLI) |

## Pridania do PATH

`$HOME/.cargo/bin` je pridané do `sessionPath`, takže binárky nainštalované cez `cargo install` sú dostupné v shelle. Pre reprodukovateľnosť však odporúčame deklarovať Rust nástroje v `packages.nix` cez `rustup` alebo konkrétne balíčky.

::: tip
Premenné session nastavené tu sa zapisujú do `~/.nix-profile/etc/profile.d/hm-session-vars.sh` a sú súborované login shelly a systémovýmd user environment.
:::
