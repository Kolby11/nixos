# Systémové balíčky

Základné balíčky dostupné všetkým používateľom, deklarované v `system/modules/packages.nix`.

<<< @/../system/modules/packages.nix

Sú to minimálne, nezávislé na zariadení položky. Užívateľské balíčky spravuje [Home Manager](/home-manager/packages) a desktop-špecifické nástroje sú v [desktop environment modules](/system/desktops/).

|                                  Balíček |                                                  Účel |
| ---------------------------------------: | ----------------------------------------------------: |
|                                   `btop` |               Interaktívny monitor procesov a zdrojov |
|                              `fastfetch` |                     Zobrazenie systémových informácií |
|                           `home-manager` | Home Manager CLI — potrebné pre `home-manager switch` |
|                                    `git` |                                       Version control |
|                                `killall` |                         Ukončenie procesov podľa mena |
|                         `vim` / `neovim` |                                   Terminálové editory |
| `openssl` + `openssl.dev` + `pkg-config` |                 TLS knižnice a tooling pre kompiláciu |
|                                   `wget` |                                    Sťahovanie súborov |
|                                   `stow` |                      Správca symlink farmy (dotfiles) |
|                                    `eza` |           Moderná náhrada `ls` s ikonami a git stavom |
