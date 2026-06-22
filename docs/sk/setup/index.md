# Nastavenie

## Prvotné nastavenie

Spusti interaktívny skript `./setup` z koreňového adresára repozitára:

```bash
./setup
```

Skript:
1. Vypíše všetky existujúce konfigurácie v `system/configurations/`
2. Vyzve ťa na výber existujúcej alebo vytvorenie novej
3. Zapíše zvolené meno zariadenia do `.setup` (ignorovaného gitom)

`.setup` obsahuje jeden riadok: `DEVICE=<meno>`. Skripty `./setup` a `./install` ho zapisujú a `./rebuild` ho číta, aby vedel, ktorý flake výstup budovať.

## Prebudovanie systému

Po akýchkoľvek zmenách v konfigurácii:

```bash
./rebuild
```

Vykoná:

```bash
sudo nixos-rebuild switch --flake .#<ZARIADENIE>
```

kde `<ZARIADENIE>` je načítané zo `.setup`.

Na explicitnú zmenu uloženého predvoleného zariadenia:

```bash
./rebuild <ZARIADENIE>
```

Tým sa overí názov zariadenia, zapíše sa do `.setup` a prebuduje sa daný cieľ.

## Pridanie nového stroja

Spusti `./setup` a vyber **"Create new configuration"**. Zadaj meno stroja (medzery sa nahradia pomlčkami). Skript automaticky:

- Spustí `nixos-generate-config` a uloží výsledok do `system/configurations/<meno>/hardware-config.nix`
- Vytvorí šablónu `system/configurations/<meno>/default.nix`
- Zaregistruje stroj v `system/configurations/default.nix`
- Pridá ho do `nixosConfigurations` v `flake.nix`

Po vytvorení uprav `system/configurations/<meno>/` na pridanie hardvérových nastavení, potom spusti `./rebuild`.

## Home Manager

Home Manager konfigurácia sa spravuje oddelene od systémového prebudovania. Na aplikovanie zmien Home Manager:

```bash
home-manager switch --flake .#kolby
```

Nevyžaduje `sudo` a neovplyvňuje systémovú konfiguráciu.

## Aktualizácia flake vstupov

Aktualizácia všetkých flake vstupov na najnovšie commity:

```bash
nix flake update
```

Aktualizácia jedného vstupu (napr. iba nixpkgs-unstable):

```bash
nix flake update nixpkgs-unstable
```

Po aktualizácii spusti `./rebuild`.
