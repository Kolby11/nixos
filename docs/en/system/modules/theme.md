# Theme

SDDM visual theme configuration in `system/modules/theme/sddm.nix`.

<<< @/../system/modules/theme/sddm.nix

## Greenleaf theme

The [sddm-greenleaf-theme](https://github.com/kamack38/sddm-greenleaf-theme) is a nature-inspired SDDM login screen theme. It is fetched from GitHub and installed as a Nix derivation so no manual file copying is needed.

The theme requires the following Qt packages at runtime (installed via `extraPackages`):

| Package | Why |
|---------|-----|
| `kdePackages.qt5compat` | Qt 5 compatibility module used by the theme's QML |
| `kdePackages.qtdeclarative` | QML engine |
| `kdePackages.qtsvg` | SVG rendering for theme assets |

JetBrains Mono Nerd Font is installed at the system level so the SDDM login screen can render it before user fonts are available.

::: info
`services.displayManager.sddm.theme` is set to `"greenleaf"` in `services.nix`. This module only installs the theme package and its dependencies.
:::
