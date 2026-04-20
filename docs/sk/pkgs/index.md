# Vlastné balíčky

Vlastné Nix derivácie balíčkov sú umiestnené v `pkgs/`. Sú zhromaždené v `pkgs/default.nix`:

<<< @/../pkgs/default.nix

Tento súbor sa importuje tak, že sa predá `{ inherit pkgs; }` tam, kde je to potrebné:

```nix
let
  customPkgs = import ../../../pkgs { inherit pkgs; };
in
# customPkgs.material-symbols, customPkgs.illogical-impulse-oneui4-icons
```

## Prečo vlastné balíčky?

Oba balíčky nie sú v nixpkgs dostupné v požadovanej podobe alebo majú nevhodnú verziu:

|                          Balíček | Dôvod pre vlastnú deriváciu                                                                                                           |
| -------------------------------: | ------------------------------------------------------------------------------------------------------------------------------------- |
|               `material-symbols` | Verzia v nixpkgs môže zaostávať; táto derivácia pripína konkrétny commit z Google repozitára a odstraňuje dlhé prípony názvov súborov |
| `illogical-impulse-oneui4-icons` | Fork ikonovej témy, ktorá nie je v nixpkgs; vyžaduje záplaty na opravu zlomených symlinkov a chýbajúcich sekcií `index.theme`         |
