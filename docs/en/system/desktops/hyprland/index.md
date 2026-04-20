# Hyprland

Hyprland is the primary active desktop environment, a Wayland compositor with dynamic tiling. Its system config lives under `system/desktops/hyprland/`.

## Programs

<<< @/../system/desktops/hyprland/programs.nix

Hyprland is enabled with UWSM (Universal Wayland Session Manager), which manages the compositor as a systemd user service. This provides proper cgroup isolation, clean startup/shutdown, and integration with `systemd --user`.

`hyprlock` is the screen locker.

The UWSM compositor entry registers Hyprland as a known compositor with a pretty name and the binary path.

## Packages

<<< @/../system/desktops/hyprland/packages.nix

Key packages:

| Package | Purpose |
|---------|---------|
| `waybar` | Status bar |
| `wlogout` | Logout/power menu |
| `wl-clipboard` | Wayland clipboard CLI tools |
| `lxqt.pcmanfm-qt` | File manager |
| `nwg-displays` | Display configuration GUI |
| `hyprshot` | Screenshot tool |
| `hyprpaper` | Wallpaper daemon |
| `hyprshade` | Display shader/filter tool |
| `hyprpicker` | Colour picker |
| `grim` + `slurp` | Screenshot + region selection |
| `kitty` | Terminal emulator |
| `oh-my-posh` | Shell prompt theme engine |
| `lm_sensors` | CPU/GPU temperature readings |
| `kdePackages.syntax-highlighting` | Syntax highlighting library for QML |
| `kdePackages.kdialog` | KDE dialog tool |

## ii-shell (QuickShell)

The most complex part of the Hyprland setup is `ii-shell.nix`, which sets up [QuickShell](https://quickshell.outfoxxed.me/) — a QML-based shell framework used to build the desktop shell (bars, widgets, notifications, etc.).

<<< @/../system/desktops/hyprland/ii-shell.nix

### Qt runtime isolation

QuickShell is built against `nixpkgs-unstable`. All Qt 6 imports it uses must come from the **same** nixpkgs instance as QuickShell itself, or ABI mismatches will cause crashes at runtime (`Qt_6_PRIVATE_API` symbol version errors). This is why `qtImports` is a list built from `pkgs-unstable` exclusively.

### quickshell-wrapped

A shell script wrapper (`qs`) is generated that injects the correct runtime paths before launching QuickShell:

| Variable | Purpose |
|----------|---------|
| `QT_PLUGIN_PATH` | Qt plugin search paths (both `qt-6/plugins` and `qt6/plugins` for compatibility) |
| `QML2_IMPORT_PATH` | QML module import paths |
| `XDG_DATA_DIRS` | Includes icon theme share directories so QuickShell can find icons |
| `QT_WAYLAND_DISABLE_WINDOWDECORATION` | Disables server-side decorations for QML windows |

### Icon themes

Multiple icon themes are installed to ensure full icon coverage:
`adwaita-icon-theme`, `hicolor-icon-theme`, `papirus-icon-theme`, `gnome-icon-theme`, `breeze-icons`, and `illogical-impulse-oneui4-icons` (custom — see [Custom Packages](/pkgs/)).

### Fonts

The `material-symbols` custom package is added to `fonts.packages` here (at the system level) so fontconfig can find it. See [Material Symbols](/pkgs/material-symbols) for the package details.

### Additional packages

| Category | Packages |
|----------|---------|
| Audio | `cava`, `playerctl`, `pavucontrol`, `easyeffects`, `songrec` |
| Media / Wallpaper | `mpv`, `mpvpaper`, `swww` |
| Brightness / Display | `brightnessctl`, `ddcutil` |
| Launcher / Input | `fuzzel`, `wtype` |
| Screenshot / Recording | `wf-recorder`, `swappy`, `imagemagick`, `ffmpeg` |
| OCR / Translation | `tesseract`, `translate-shell` |
| Libraries | `libdbusmenu-gtk3`, `libsoup_3`, `libsecret`, `gnome-keyring`, `gobject-introspection`, `gsettings-desktop-schemas` |
