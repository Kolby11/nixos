# Nix Settings

Core Nix daemon configuration in `system/modules/nixsettings.nix`.

<<< @/../system/modules/nixsettings.nix

## Experimental features

`nix-command` and `flakes` are enabled. These unlock the new `nix` CLI (`nix run`, `nix shell`, `nix build`) and the `flake.nix`-based system configuration itself.

## Store optimisation

`auto-optimise-store = true` deduplicates identical files in the Nix store using hard links after each build, reducing disk usage over time without manual intervention.

## Binary caches

The `nix-gaming` cache (`nix-gaming.cachix.org`) is added as a trusted substituter. This allows fetching pre-built gaming packages (wine-tkg, proton-ge, etc.) from the cache instead of compiling them locally.

::: info
The same `nix-gaming` cache settings also appear in `gaming.nix`, which was originally intended as the dedicated gaming module. The duplication is harmless — Nix merges list-type settings.
:::

## Garbage collection

Automatic GC runs weekly and removes generations older than 7 days. Useful manual commands:

```bash
nix-collect-garbage -d   # remove all old generations and GC
nix store gc             # GC without removing generations
```

::: tip
[All nix.settings options](https://search.nixos.org/options?channel=25.05&query=nix.settings)
:::
