# Material Symbols

Vlastná derivácia pre Google Material Symbols variable font, nachádza sa v `pkgs/material-symbols/default.nix`.

<<< @/../pkgs/material-symbols/default.nix

## Čo inštaluje

Derivácia stiahne konkrétny commit repozitára `google/material-design-icons` z GitHubu (sparse checkout iba adresára `variablefont/`) a nainštaluje `.ttf` variable font súbory do `$out/share/fonts/TTF/`.

Nástroj `rename` odstráni príponu `[FILL,GRAD,opsz,wght]` z názvov súborov — Google zdrojové súbory pridávajú tieto axis popisy, napr. `MaterialSymbolsOutlined[FILL,GRAD,opsz,wght].ttf`. Po premenovaní zostane `MaterialSymbolsOutlined.ttf`.

## Prečo variable fonty?

Material Symbols sú distribuované ako OpenType variable fonty so štyrmi osami: Fill, Grade, Optical Size a Weight. Jeden variable font pokrýva všetky štýly a váhy, na rozdiel od starších Material Icons, ktoré vyžadovali samostatné súbory pre každý štýl.

## Použitie

Tento balíček je pridaný do `fonts.packages` v `system/desktops/hyprland/ii-shell.nix` na systémovej úrovni (takže SDDM a všetky relácie ho vidia), a tiež inštalovaný cez Home Manager v `home/kolby/fonts.nix`.

::: info
Systémová inštalácia v `ii-shell.nix` zabezpečuje, že font je viditeľný pre fontconfig. Samotný Home Manager často nestačí, pretože fontconfig potrebuje font v systémovej ceste, aby ho QuickShell (ktorý beží ako user service) spoľahlivo našiel.
:::
