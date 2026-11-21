{ pkgs, pkgs-unstable, inputs, lib, ... }:

let
  customPkgs = import ../../pkgs { inherit pkgs; };
  roblox = builtins.fromJSON (builtins.readFile ./roblox-tools.json);
  # Studio and its MCP server need to use the same Wine build and prefix.
  vinegarWine = lib.findFirst (pkg: (pkg.pname or "") == "wine64")
    (throw "Could not find Vinegar's Wine package") pkgs-unstable.vinegar.buildInputs;
  studioMcp = pkgs.writeShellApplication {
    name = "roblox-studio-mcp";
    text = ''
      data_dir="''${XDG_DATA_HOME:-$HOME/.local/share}/vinegar"
      export WINEPREFIX="$data_dir/prefixes/studio"
      export WINEDEBUG=-all
      export WINEDLLOVERRIDES='winemenubuilder.exe,mscoree,mshtml='

      server=""
      for candidate in "$data_dir"/versions/*/StudioMCP.exe; do
        if [[ -f "$candidate" && "$candidate" -nt "$server" ]]; then
          server="$candidate"
        fi
      done

      if [[ ! -f "$WINEPREFIX/system.reg" || -z "$server" ]]; then
        echo 'Launch Roblox Studio through Vinegar first.' >&2
        exit 1
      fi

      exec ${vinegarWine}/bin/wine "$server" "$@"
    '';
  };
  codexCli = inputs.codex-cli-nix.packages.${pkgs.stdenv.hostPlatform.system}.default.overrideAttrs (old: {
    # codex-cli-nix disables its updater because Nix store paths are immutable.
    # Keep the package Nix-managed; this only removes the opt-out flag so Codex
    # can perform its own update check and report what it would do.
    postInstall = (old.postInstall or "") + ''
      sed -i '/DISABLE_AUTOUPDATER/d' "$out/bin/codex"
    '';
  });
in
{
  home.packages = with pkgs-unstable; [
    # Essentials
    fzf
    lazygit
    gitui
    tmux
    oh-my-posh
    (lib.lowPrio matugen)
    tmatrix
    (lib.lowPrio cliphist)
    (lib.lowPrio wl-clipboard)
    pkgs.gh
    pkgs.jq

    # Password manager
    bitwarden-desktop

    # Editor
    vscode-fhs

    # Dev
    cmake
    ninja
    gnumake
    gcc
    go
    lua
    nodejs_24
    pkgs.pnpm_9
    (lib.hiPrio python3)
    (lib.lowPrio kdePackages.breeze-icons)
    rustup
    pkgsCross.mingwW64.stdenv.cc 
    pkgsCross.mingwW64.windows.pthreads
    dotnet-sdk_9
    cloc

    # AI
    pkgs.claude-code
    codexCli
    antigravity-cli
    inputs.codex-desktop-linux.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Browser
    firefox
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default

    # Communication
    teams-for-linux
    vesktop # Discord client

    # Bluetooth
    blueman

    # Hyprland monitor layout editor and automatic profile switcher
    pkgs-unstable.hyprmoncfg

    # Gaming
    steam
    steam-run
    heroic # Epic Games Store / GOG / Amazon launcher
    (pkgs.lutris.override {
      extraPkgs = pkgs: [
        wineWow64Packages.stable
        winetricks
      ];
    })

    # Office
    libreoffice
    obsidian

    # Drawing
    krita

    # 3D Modeling
    blender

    # Music
    # The mutable Spicetify launcher in ~/.config/dotfiles patches this copy
    # at runtime; do not replace it with the immutable spicetify-nix package.
    (lib.lowPrio pkgs-unstable.spotify)
    pkgs-unstable.spicetify-cli
    inputs.kew.packages.${pkgs.stdenv.hostPlatform.system}.default

    # ii shell Python dependencies
    (lib.lowPrio (python3.withPackages (ps: with ps; [
      dbus-python
      materialyoucolor
      material-color-utilities
      pywayland
      psutil
      pygobject3
      pycairo
      setproctitle
      numpy
      pillow
      tqdm
      loguru
    ])))

    # Game development
    unityhub
    godot-mono

    # Video Editing
    #davinci-resolve
  ]
  ++ lib.optional roblox.player pkgs.flatpak
  ++ lib.optional roblox.studio pkgs-unstable.vinegar
  ++ lib.optional (roblox.studio && roblox.studioMcp) studioMcp
  ++ lib.optional roblox.rojo pkgs-unstable.rojo
  ++ lib.optional roblox.luauLsp pkgs-unstable.luau-lsp
  ++ lib.optional roblox.stylua pkgs-unstable.stylua
  ++ lib.optional roblox.selene pkgs-unstable.selene
  ++ lib.optional roblox.wally pkgs-unstable.wally;
}
