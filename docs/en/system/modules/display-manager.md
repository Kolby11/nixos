# Display Manager & Services

Configured in `system/modules/services.nix`.

<<< @/../system/modules/services.nix

## SDDM

[SDDM](https://github.com/sddm/sddm) is the display manager. It runs in Wayland mode using the KDE SDDM package.

| Option | Value | Notes |
|--------|-------|-------|
| `wayland.enable` | `true` | SDDM itself runs as a Wayland compositor, not X11 |
| `package` | `kdePackages.sddm` | KDE-maintained build with Qt 6 |
| `theme` | `"greenleaf"` | Nature-inspired theme — see [Theme](/system/modules/theme) |
| `defaultSession` | `"hyprland-uwsm"` | Session selected by default on login |

## Supporting services

| Service | Purpose |
|---------|---------|
| `dbus` | IPC message bus required by all desktop components |
| `openssh` | SSH server |
| `geoclue2` | Location services for QtPositioning (QuickShell weather widgets) |
| `upower` | Battery status and power management events |
| `udisks2` | Automounting external storage, used by PCManFM |
| `gnome.gnome-keyring` | Secret storage for applications using `libsecret` |
| `libinput` | Input device handling; natural scrolling enabled for touchpads |
| `xserver` | X.Org server — required even on Wayland for i3 and X11 app support |

::: tip
[All services.displayManager.sddm options](https://search.nixos.org/options?channel=25.05&query=services.displayManager.sddm)
:::
