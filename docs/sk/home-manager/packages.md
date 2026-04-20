# Balíčky

Užívateľské balíčky deklarované v `home/kolby/packages.nix`.

<<< @/../home/kolby/packages.nix

## Kategórie balíčkov

### Vývoj

|                               Balíček |                                                                          Účel |
| ------------------------------------: | ----------------------------------------------------------------------------: |
|                          `vscode-fhs` | VS Code v FHS prostredí (potrebné pre rozšírenia používajúce nativné binárky) |
|    `cmake`, `ninja`, `gnumake`, `gcc` |                                                     Build toolchain pre C/C++ |
|                                  `go` |                                                                 Kompilátor Go |
|                                 `lua` |                                                                 Interpret Lua |
|     `nodejs_24` + `nodePackages.pnpm` |                                               Node.js a správca balíčkov pnpm |
|                    `python3` (hiPrio) |                                                                      Python 3 |
|                              `rustup` |                                                       Správca Rust toolchainu |
|        `pkgsCross.mingwW64.stdenv.cc` |                             Windows cross-compiler (GCC cielený na MinGW-w64) |
| `pkgsCross.mingwW64.windows.pthreads` |                                         pthreads pre Windows cross-kompiláciu |
|   `dotnet-sdk_9` + `dotnet-runtime_9` |                                                          .NET 9 SDK a runtime |

### AI

|       Balíček |                                                     Účel |
| ------------: | -------------------------------------------------------: |
| `claude-code` | CLI pre Claude Code (z overlay `sadjow/claude-code-nix`) |

### Aplikácie

|           Balíček |                                                        Účel |
| ----------------: | ----------------------------------------------------------: |
|         `firefox` |                                           Webový prehliadač |
| `teams-for-linux` |                                      Microsoft Teams klient |
|         `vesktop` |                         Discord klient (na základe Vencord) |
|       `blueberry` |                                       GUI manažér Bluetooth |
|           `krita` |                                         Digitálne maľovanie |
|         `blender` |                                  3D modelovanie a rendering |
|         `spotify` |                                          Streamovanie hudby |
|             `kew` | Terminálový prehrávač hudby (z vlastného fork flake inputu) |

### Hry

|           Balíček |                                                   Účel |
| ----------------: | -----------------------------------------------------: |
|           `steam` |                                  Herná platforma Steam |
|       `steam-run` |                              FHS wrapper pre Steam hry |
| `lutris` (s Wine) | Správca hier s `wineWowPackages.stable` a `winetricks` |

### ii-shell Python závislosti

`python3.withPackages` derivácia poskytuje Python runtime, ktorý skripty ii-shell vyžadujú:

|                                         Balíček |                                  Účel |
| ----------------------------------------------: | ------------------------------------: |
|                                   `dbus-python` |                             D-Bus IPC |
| `materialyoucolor` + `material-color-utilities` | Material You dynamické farebné schémy |
|                                     `pywayland` |             Wayland protocol bindings |
|                                        `psutil` |                  Systémové informácie |
|                        `pygobject3` + `pycairo` |                  GObject/GTK viazania |
|                                  `setproctitle` |              Nastavenie názvu procesu |
|             `numpy`, `pillow`, `tqdm`, `loguru` |                               Utility |

### Game development

|      Balíček |                            Účel |
| -----------: | ------------------------------: |
|   `unityhub` |           Správca Unity editoru |
| `godot-mono` | Godot engine s .NET/C# podporou |

### Nástroje

|                              Balíček |                          Účel |
| -----------------------------------: | ----------------------------: |
|                                `fzf` |                  Fuzzy finder |
|                            `matugen` | Generátor Material You farieb |
|                            `tmatrix` |   Matrix terminálová animácia |
|                           `cliphist` |             História schránky |
|                       `wl-clipboard` |         Wayland clipboard CLI |
| `kdePackages.breeze-icons` (lowPrio) |         Náhradná ikonová téma |
