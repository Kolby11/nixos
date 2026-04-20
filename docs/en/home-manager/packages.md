# Packages

User packages declared in `home/kolby/packages.nix`.

<<< @/../home/kolby/packages.nix

## Package categories

### Development

| Package | Purpose |
|---------|---------|
| `vscode-fhs` | VS Code in an FHS environment (required for extensions that use native binaries) |
| `cmake`, `ninja`, `gnumake`, `gcc` | C/C++ build toolchain |
| `go` | Go compiler |
| `lua` | Lua interpreter |
| `nodejs_24` + `nodePackages.pnpm` | Node.js and pnpm package manager |
| `python3` (hiPrio) | Python 3 |
| `rustup` | Rust toolchain manager |
| `pkgsCross.mingwW64.stdenv.cc` | Windows cross-compiler (GCC targeting MinGW-w64) |
| `pkgsCross.mingwW64.windows.pthreads` | pthreads for Windows cross-compilation |
| `dotnet-sdk_9` + `dotnet-runtime_9` | .NET 9 SDK and runtime |

### AI

| Package | Purpose |
|---------|---------|
| `claude-code` | Claude Code CLI (from `sadjow/claude-code-nix` overlay) |

### Applications

| Package | Purpose |
|---------|---------|
| `firefox` | Web browser |
| `teams-for-linux` | Microsoft Teams client |
| `vesktop` | Discord client (Vencord-based) |
| `blueberry` | Bluetooth manager GUI |
| `krita` | Digital painting |
| `blender` | 3D modelling and rendering |
| `spotify` | Music streaming |
| `kew` | Terminal music player (from custom fork flake input) |

### Gaming

| Package | Purpose |
|---------|---------|
| `steam` | Steam gaming platform |
| `steam-run` | FHS environment wrapper for Steam games |
| `lutris` (with Wine) | Game manager with `wineWowPackages.stable` and `winetricks` |

### ii-shell Python dependencies

A `python3.withPackages` derivation provides the Python runtime that the ii-shell scripts require:

| Package | Purpose |
|---------|---------|
| `dbus-python` | D-Bus IPC |
| `materialyoucolor` + `material-color-utilities` | Material You dynamic theming |
| `pywayland` | Wayland protocol bindings |
| `psutil` | Process and system info |
| `pygobject3` + `pycairo` | GObject/GTK bindings |
| `setproctitle` | Set process name |
| `numpy`, `pillow`, `tqdm`, `loguru` | Utilities |

### Game development

| Package | Purpose |
|---------|---------|
| `unityhub` | Unity editor manager |
| `godot-mono` | Godot engine with .NET/C# support |

### Utilities

| Package | Purpose |
|---------|---------|
| `fzf` | Fuzzy finder |
| `matugen` | Material You colour generator |
| `tmatrix` | Matrix terminal animation |
| `cliphist` | Clipboard history manager |
| `wl-clipboard` | Wayland clipboard CLI |
| `kdePackages.breeze-icons` (lowPrio) | Fallback icon theme |
