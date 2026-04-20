# Správca zobrazenia a služby

Nakonfigurované v `system/modules/services.nix`.

<<< @/../system/modules/services.nix

## SDDM

[SDDM](https://github.com/sddm/sddm) je správca zobrazenia. Beží vo Wayland móde pomocou KDE SDDM balíčka.

| Možnosť | Hodnota | Poznámky |
|---------|---------|---------|
| `wayland.enable` | `true` | SDDM samotné beží ako Wayland kompozítor |
| `package` | `kdePackages.sddm` | KDE build s Qt 6 |
| `theme` | `"greenleaf"` | Prírode inšpirovaná téma — pozri [Téma](/sk/system/modules/theme) |
| `defaultSession` | `"hyprland-uwsm"` | Predvolená relácia pri prihlásení |

## Podporné služby

| Služba | Účel |
|--------|------|
| `dbus` | IPC message bus vyžadovaný všetkými desktop komponentmi |
| `openssh` | SSH server |
| `geoclue2` | Lokalizačné služby pre QtPositioning (QuickShell weather widgety) |
| `upower` | Stav batérie a udalosti správy napájania |
| `udisks2` | Automatické pripájanie externého úložiska (PCManFM) |
| `gnome.gnome-keyring` | Bezpečné úložisko pre aplikácie používajúce `libsecret` |
| `libinput` | Správa vstupných zariadení; pre touchpad povolené prirodzené scrollovanie |
| `xserver` | X.Org server — potrebný pre i3 a X11 aplikácie |

::: tip
[Všetky možnosti services.displayManager.sddm](https://search.nixos.org/options?channel=25.05&query=services.displayManager.sddm)
:::
