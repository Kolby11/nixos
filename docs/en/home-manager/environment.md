# Environment

Session environment configuration in `home/kolby/environment.nix`.

<<< @/../home/kolby/environment.nix

## Session variables

| Variable | Value | Purpose |
|----------|-------|---------|
| `DOTNET_ROOT` | `${pkgs.dotnet-sdk}` | Points .NET SDK tooling (e.g., IDEs, `dotnet` CLI) to the Nix-installed .NET root |

## PATH additions

`$HOME/.cargo/bin` is added to `sessionPath` so Rust binaries installed via `cargo install` are available in the shell. Note that for reproducibility, prefer declaring Rust tools in `packages.nix` via `rustup` or specific crate packages instead.

::: tip
Session variables set here are written to `~/.nix-profile/etc/profile.d/hm-session-vars.sh` and sourced by login shells and the systemd user environment.
:::
