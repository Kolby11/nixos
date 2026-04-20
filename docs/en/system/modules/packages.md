# System Packages

Base packages available to all users, declared in `system/modules/packages.nix`.

<<< @/../system/modules/packages.nix

These are minimal machine-independent essentials. User-specific packages are managed through [Home Manager](/home-manager/packages) and desktop-specific tools live in the [desktop environment modules](/system/desktops/).

| Package | Purpose |
|---------|---------|
| `btop` | Interactive process and resource monitor |
| `fastfetch` | System info display |
| `home-manager` | Home Manager CLI — needed to run `home-manager switch` |
| `git` | Version control |
| `killall` | Process termination by name |
| `vim` / `neovim` | Terminal text editors |
| `openssl` + `openssl.dev` + `pkg-config` | TLS libraries and build tooling for compiled programs |
| `wget` | File downloader |
| `stow` | Symlink farm manager (dotfiles) |
| `eza` | Modern `ls` replacement with icons and git status |
