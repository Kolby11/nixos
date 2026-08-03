{ ... }:

let
  templateRoot = ".local/share/desktop-profile-templates/kde/breeze";
in
{
  home.file = {
    "${templateRoot}/kdeglobals".text = ''
      [General]
      ColorScheme=BreezeLight

      [Icons]
      Theme=breeze

      [KDE]
      LookAndFeelPackage=org.kde.breeze.desktop
      widgetStyle=Breeze
    '';

    "${templateRoot}/kwinrc".text = ''
      [Desktops]
      Number=2
      Rows=1

      [Windows]
      ElectricBorders=0
    '';
  };
}
