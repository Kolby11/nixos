# Programs

System-wide program configuration in `system/modules/programs.nix`.

<<< @/../system/modules/programs.nix

## XDG desktop portal

The `xdg-desktop-portal-gtk` portal backend provides file pickers, screen sharing, and other system integration for Wayland applications.

`xdgOpenUsePortal = true` routes `xdg-open` calls through the portal instead of calling it directly, ensuring consistent file-open dialogs in sandboxed applications.

## direnv

[direnv](https://direnv.net/) automatically activates and deactivates environment variables when entering or leaving a directory containing a `.envrc` file. `nix-direnv` adds Nix shell integration: `use flake` in `.envrc` activates the flake's devShell automatically without needing `nix develop`.

## nix-ld

`nix-ld` provides a dynamic linker shim that allows running pre-compiled binaries (proprietary tools, downloaded executables) that were linked against standard FHS paths. The injected libraries cover the most common dependencies:

| Library | Why |
|---------|-----|
| `stdenv.cc.cc` | C++ standard library (`libstdc++`) |
| `zlib` | Compression — used by almost everything |
| `openssl` | TLS — used by network-capable binaries |
| `icu` | Unicode — used by many runtimes (.NET, etc.) |

## Fish shell

Fish is enabled system-wide so it can be set as the login shell for any user without requiring a separate install.

## GnuPG agent

The GnuPG agent runs with SSH support, allowing GPG keys to authenticate SSH connections instead of (or alongside) OpenSSH keys.
