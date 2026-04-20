# Nastavenia Nix

Konfigurácia jadra Nix démona v `system/modules/nixsettings.nix`.

<<< @/../system/modules/nixsettings.nix

## Experimentálne funkcie

`nix-command` a `flakes` sú povolené. Odomknú nové `nix` CLI (`nix run`, `nix shell`, `nix build`) a `flake.nix` konfiguráciu systému.

## Optimalizácia store

`auto-optimise-store = true` deduplikuje identické súbory v Nix store pomocou hardlinkov po každom zostavení, čím znižuje využitie disku.

## Binárne cache

`nix-gaming` cache je pridaná ako dôveryhodný substitútor. Umožňuje sťahovanie pre-zostavených herných balíčkov (wine-tkg, proton-ge, atď.) namiesto lokálnej kompilácie.

::: info
Rovnaké nastavenia nix-gaming cache sa objavujú aj v `gaming.nix`. Duplicita je neškodná — Nix spája nastavenia typu zoznam.
:::

## Garbage collection

Automatické GC beží každý týždeň a maže generácie staršie ako 7 dní. Užitočné manuálne príkazy:

```bash
nix-collect-garbage -d   # odstráni všetky staré generácie a vykoná GC
nix store gc             # GC bez odstraňovania generácií
```

::: tip
[Všetky možnosti nix.settings](https://search.nixos.org/options?channel=25.05&query=nix.settings)
:::
