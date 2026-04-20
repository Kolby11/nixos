# Základné princípy

## Rozdelenie systém vs. Home Manager

**Systémová konfigurácia** (`system/`) inštaluje a povoluje všetko, čo desktopové prostredie potrebuje na fungovanie: správca okien alebo kompozítor, správca zobrazenia, správa relácií a všetky podporné programy, na ktorých každý desktop závisí — stavové lišty, spúšťače, správcovia súborov, schránka, notifikačné démony.

**Home Manager** (`home/`) spravuje celú konfiguráciu na úrovni používateľa: dotfiles, používateľské balíčky, nastavenie shellu, fonty a témy. Home Manager konfigurácia je navrhnutá tak, aby bola **špecifická pre desktop** — pre každé desktopové prostredie by mal existovať samostatný používateľský modul, aby sa nástroje jedného desktopu nemiešali s druhým.

## Prečo toto rozdelenie?

- **Žiadna duplicita**: systém deklaruje čo je dostupné; Home Manager deklaruje ako je to nakonfigurované.
- **Izolácia**: povolenie alebo zakázanie celého desktopového prostredia je jedna zmena importu v `system/desktops/default.nix`.
- **Prenosnosť**: Home Manager konfigurácia sa viaže na identitu používateľa, nie na stroj.
- **Reprodukovateľnosť**: každý balíček a každá konfiguračná hodnota je deklarovaná v Nixe — žiadne manuálne inštalácie, žiadny configuration drift.

## Podpora viacerých strojov

Flake definuje pomocnú funkciu `mkSystem`, ktorá prijíma argument `device`:

```nix
mkSystem = device: lib.nixosSystem {
  inherit system;
  modules = [ ./system/configuration.nix ... ];
  specialArgs = { inherit inputs device; };
};
```

Každý stroj (`desktop`, `legion`) má vlastný záznam v `nixosConfigurations`. Reťazec `device` prechádza cez `system/configurations/default.nix` na výber správnych hardvérových nastavení pre dané zariadenie.

## Flake kanály

Súčasne sú pripnuté dva kanály nixpkgs:

- `nixpkgs` (`nixos-25.05`) — pre stabilné systémové balíčky a Home Manager
- `nixpkgs-unstable` — pre balíčky vyžadujúce novšie verzie, konkrétne `quickshell` a Qt 6 balíčky

Nestabilné balíčky sú predávané do modulov cez `pkgs-unstable` v `specialArgs`.
