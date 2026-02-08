{ config, pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    waybar
    wlogout
    wl-clipboard
    lxqt.pcmanfm-qt
    nwg-displays
    hyprshot
    hyprpaper
    hyprshade
    libnotify
    inotify-tools
    slurp
    hyprpicker
    grim
    # Terminal
    kitty
    starship


    kdePackages.qtwayland
    kdePackages.qtpositioning
    kdePackages.qtlocation
    kdePackages.syntax-highlighting
    gsettings-desktop-schemas
    # https://nixos.wiki/wiki/Qt
    # https://github.com/NixOS/nixpkgs/blob/master/pkgs/development/libraries/qt-6/srcs.nix
    qt6.qtbase #qt6-base
    qt6.qtdeclarative #qt6-declarative
    qt6.qt5compat #qt6-5compat
    #qt6-avif-image-plugin (TODO: seems not available as nixpkg)
    qt6.qtimageformats #qt6-imageformats
    qt6.qtmultimedia #qt6-multimedia
    qt6.qtpositioning #qt6-positioning
    qt6.qtquicktimeline #qt6-quicktimeline
    qt6.qtsensors #qt6-sensors
    qt6.qtsvg #qt6-svg
    qt6.qttools #qt6-tools
    qt6.qttranslations #qt6-translations
    qt6.qtvirtualkeyboard #qt6-virtualkeyboard
    qt6.qtwayland #qt6-wayland
    kdePackages.kirigami #kirigami
    kdePackages.kdialog #kdialog
    kdePackages.syntax-highlighting
    inputs.quickshell.packages.${pkgs.system}.default
    inputs.caelestia-shell.packages.${pkgs.system}.default
    inputs.caelestia-cli.packages.${pkgs.system}.default
  ];
}