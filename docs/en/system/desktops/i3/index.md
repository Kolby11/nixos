# i3

i3 is an X11 tiling window manager. Its system config lives under `system/desktops/i3/`. It is currently **inactive** — uncomment `./i3` in `system/desktops/default.nix` to enable it.

## Services

<<< @/../system/desktops/i3/services.nix

i3 runs under X.Org. The keyboard layout is set to `us,sk` with `alt+shift` to toggle between them.

[Picom](https://github.com/yshui/picom) provides compositing with 14px corner radius for window rounding.

## Programs

<<< @/../system/desktops/i3/programs.nix

The KDE XDG portal backend is used (instead of GTK). `i3lock` is the screen locker.

## Packages

<<< @/../system/desktops/i3/packages.nix

| Package | Purpose |
|---------|---------|
| `polybar` | Status bar |
| `libnotify` | Notification send utility |
| `mako` | Wayland notification daemon (used in i3 for `notify-send` compatibility) |
| `rofi` | Application launcher |
| `swayidle` | Idle management |
| `swaylock-effects` | Screen locker with visual effects |
| `wlogout` | Logout menu |
| `wl-clipboard` | Clipboard tools |
| `lxqt.pcmanfm-qt` | File manager |

## Security (PAM)

<<< @/../system/desktops/i3/security.nix

PAM services for i3lock, i3lock-color, xlock, and xscreensaver are enabled so these screen lockers can authenticate users via PAM.
