# Home Manager

Home Manager manages the user environment for `kolby` declaratively. The root module is `home/kolby/default.nix`:

<<< @/../home/kolby/default.nix

## Configuration

| Setting | Value |
|---------|-------|
| `home.username` | `kolby` |
| `home.homeDirectory` | `/home/kolby` |
| `home.stateVersion` | `25.05` |
| `nixpkgs.config.allowUnfree` | `true` |

## Applying changes

```bash
home-manager switch --flake .#kolby
```

This does not require `sudo` and does not affect the system configuration.

## Sections

| File | Contents |
|------|---------|
| [packages.nix](/home-manager/packages) | User packages (dev tools, apps, gaming, etc.) |
| [programs.nix](/home-manager/programs) | Configured programs (yazi, home-manager) |
| [fonts.nix](/home-manager/fonts) | Fonts, fontconfig defaults, cursor theme |
| [environment.nix](/home-manager/environment) | Session variables and PATH additions |
