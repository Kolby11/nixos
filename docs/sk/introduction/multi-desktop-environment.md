# Viac-desktopové prostredie

Konfigurácia podporuje viacero desktopových prostredí z jednej inštalácie NixOS. Každý desktop je samostatný modul v `system/desktops/` a dá sa zapnúť jednou zmenou importu.

## Aktívne deskopy

`system/desktops/default.nix` riadi, ktoré deskopy sú zabudované do systému:

<<< @/../system/desktops/default.nix

V súčasnosti je aktívny iba **Hyprland**. Odkomentovanie `./i3` alebo `./gnome` povolí ďalšie prostredia.

## Systémová konfigurácia per-desktop

Každý desktopový modul (`system/desktops/<meno>/`) deklaruje všetko, čo daný desktop potrebuje na systémovej úrovni:

- **packages** — nástroje, na ktorých WM/kompozítor závisí (lišty, spúšťače, nástroje pre snímky obrazovky, atď.)
- **programs** — NixOS programové možnosti (napr. `programs.hyprland.enable`)
- **services** — systemd alebo display server služby, ktoré desktop vyžaduje

Základné systémové moduly (sieť, zvuk, boot, atď.) sú zdieľané — deskopy pridávajú iba to, čo je špecifické pre daný desktop.

## Home Manager konfigurácia per-desktop

Konfigurácia na úrovni používateľa (dotfiles, témy, nastavenia aplikácií) je spravovaná cez Home Manager. Zámerom je, aby každé desktopové prostredie malo vlastný Home Manager modul — napríklad Waybar konfigurácia používateľa Hyprland nespolunažíva s Polybar konfiguráciou používateľa i3.

## Dostupné desktopové prostredia

| Desktop | Stav | Poznámky |
|---------|------|---------|
| Hyprland | **Aktívny** | Wayland kompozítor s QuickShell (ii-shell) |
| i3 | Neaktívny | X11 dlaždicový správca okien s Polybar |
| GNOME | Neaktívny | Plné desktopové prostredie |
| KDE | Plánovaný | Ešte nenakonfigurovaný |
