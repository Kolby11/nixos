{ pkgs, ... }:

let
  sddm-greenleaf-theme = pkgs.stdenvNoCC.mkDerivation {
    pname = "sddm-greenleaf-theme";
    version = "1.0.0";

    src = pkgs.fetchFromGitHub {
      owner = "kamack38";
      repo = "sddm-greenleaf-theme";
      rev = "main";
      sha256 = "sha256-AGcC7nlrW13dRVVHtgl6+vvnM1feXU/xPhntpfYWY9Y=";
    };

    installPhase = ''
      mkdir -p $out/share/sddm/themes/greenleaf
      cp -r ./* $out/share/sddm/themes/greenleaf/
    '';

    meta = with pkgs.lib; {
      description = "A nature-inspired SDDM theme";
      homepage = "https://github.com/kamack38/sddm-greenleaf-theme";
      license = licenses.gpl3;
      platforms = platforms.linux;
    };
  };
in
{
  environment.systemPackages = [ sddm-greenleaf-theme ];

  services.displayManager.sddm = {
    theme = "greenleaf";
    extraPackages = with pkgs; [
      kdePackages.qt5compat
      kdePackages.qtdeclarative
      kdePackages.qtsvg
    ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}
