{ pkgs, pkgs-unstable, lib, inputs, ... }:

let
  customPkgs = import ../../../pkgs { inherit pkgs; };

  # Icon themes needed for QuickShell icon resolution
  iconThemes = with pkgs; [
    adwaita-icon-theme
    hicolor-icon-theme
    papirus-icon-theme
    gnome-icon-theme
    kdePackages.breeze-icons
    customPkgs.illogical-impulse-oneui4-icons
  ];

  # All Qt imports must come from the same nixpkgs as quickshell (unstable)
  # to avoid symbol version mismatches (Qt_6_PRIVATE_API ABI)
  qtImports = with pkgs-unstable; [
    kdePackages.qtbase
    kdePackages.qtdeclarative
    kdePackages.qtsvg
    kdePackages.qtwayland
    kdePackages.qt5compat
    kdePackages.qtimageformats
    kdePackages.qtmultimedia
    kdePackages.qtpositioning
    kdePackages.qtsensors
    kdePackages.qtquicktimeline
    kdePackages.qttools
    kdePackages.qttranslations
    kdePackages.qtvirtualkeyboard
    kdePackages.qtwebsockets
    kdePackages.syntax-highlighting
    kdePackages.kirigami.unwrapped
    kdePackages.kdialog
  ];

  # Wrap quickshell to inject correct Qt paths at runtime
  quickshell-wrapped = pkgs-unstable.writeShellScriptBin "qs" ''
    export QT_PLUGIN_PATH="${lib.makeSearchPath "lib/qt-6/plugins" qtImports}:${lib.makeSearchPath "lib/qt6/plugins" qtImports}"
    export QML2_IMPORT_PATH="${lib.makeSearchPath "lib/qt-6/qml" qtImports}"
    export XDG_DATA_DIRS="${lib.makeSearchPath "share" iconThemes}:$HOME/.nix-profile/share:$HOME/.local/share:/etc/profiles/per-user/$USER/share:/run/current-system/sw/share:/usr/share:$XDG_DATA_DIRS"
    export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
    exec ${inputs.quickshell.packages.${pkgs-unstable.stdenv.hostPlatform.system}.default}/bin/qs "$@"
  '';
in
{
  fonts.packages = [ customPkgs.material-symbols ];

  environment.systemPackages = qtImports ++ iconThemes ++ [
    quickshell-wrapped

    # Audio
    pkgs.cava
    pkgs.playerctl
    pkgs.pavucontrol
    pkgs.easyeffects
    pkgs.songrec

    # Media / wallpaper
    # pkgs.mpv
    # pkgs.mpvpaper
    pkgs.awww

    # Brightness / display
    pkgs.brightnessctl
    pkgs.ddcutil

    # Launcher / input
    pkgs.fuzzel
    pkgs.wtype

    # Screenshot / recording
    pkgs.wf-recorder
    pkgs.swappy
    pkgs.imagemagick
    pkgs.ffmpeg

    # System info / power
    pkgs.upower

    # OCR / translation
    pkgs.tesseract
    pkgs.translate-shell

    # Libraries / runtime
    pkgs.libdbusmenu-gtk3
    pkgs.libsoup_3
    pkgs.libsecret
    pkgs.gnome-keyring
    pkgs.gobject-introspection
    pkgs.bc
    pkgs.axel
    pkgs.gsettings-desktop-schemas
  ];

  services = {
    geoclue2.enable = true;
    upower.enable = true;
    gnome.gnome-keyring.enable = true;
  };
}
