# Systémová konfigurácia

Koreňová systémová konfigurácia je `system/configuration.nix`:

<<< @/../system/configuration.nix

Má tri zodpovednosti:

- **`./modules`** — zdieľaná systémová konfigurácia (boot, sieť, zvuk, používatelia, atď.)
- **`./desktops`** — moduly desktopových prostredí, ktoré sú momentálne aktívne
- **`./configurations`** — hardvérové nastavenia per-zariadenie vybrané na základe argumentu `device` z flake

`system.stateVersion` je nastavené na `"25.05"` a nemalo by sa meniť po prvotnej inštalácii — riadi stavové predvolené hodnoty pre služby, ktoré NixOS spravuje.
