{ pkgs, ... }:

let
  customPkgs = import ../../pkgs { inherit pkgs; };
in
{
  home.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu-mono
    customPkgs.material-symbols
    material-icons
  ];

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 18;
    gtk.enable = true;
    x11.enable = true;
  };

  fonts.fontconfig = {
    enable = true;
    # antialias = true;

    defaultFonts = {
      monospace = [
        "FiraCode Nerd Font Mono"
        "UbuntuMono Nerd Font Mono"
      ];
      emoji = [
        "FiraCode Nerd Font"
      ];
    };
  };
}


