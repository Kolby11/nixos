# Fonts & Cursor

Font and cursor configuration in `home/kolby/fonts.nix`.

<<< @/../home/kolby/fonts.nix

## Installed fonts

| Font | Purpose |
|------|---------|
| `nerd-fonts.fira-code` | Primary monospace font with programming ligatures and Nerd Font icons |
| `nerd-fonts.jetbrains-mono` | Alternative monospace with coding ligatures |
| `nerd-fonts.ubuntu-mono` | Fallback monospace |
| `customPkgs.material-symbols` | Variable icon font used by QuickShell/ii-shell (see [Material Symbols](/pkgs/material-symbols)) |

## Fontconfig

`fonts.fontconfig.enable = true` activates fontconfig for the user profile so installed fonts are discovered by applications.

Default font assignments:

| Category | Font |
|----------|------|
| Monospace | FiraCode Nerd Font Mono → UbuntuMono Nerd Font Mono (fallback) |
| Emoji | FiraCode Nerd Font |

## Cursor

The `Bibata-Modern-Classic` cursor theme is set for both GTK and X11 sessions:

| Setting | Value |
|---------|-------|
| `name` | `Bibata-Modern-Classic` |
| `package` | `bibata-cursors` |
| `size` | `18` |

Both `gtk.enable` and `x11.enable` are `true` so the cursor applies in Wayland (GTK) and X11 sessions.
