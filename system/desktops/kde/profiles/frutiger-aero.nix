{ pkgs, ... }:

let
  frutigerAeroColors = pkgs.writeTextFile {
    name = "frutiger-aero-colors";
    destination = "/share/color-schemes/FrutigerAero.colors";
    text = ''
      [ColorEffects:Disabled]
      Color=112,125,138
      ColorAmount=0
      ColorEffect=0
      ContrastAmount=0.65
      ContrastEffect=1
      IntensityAmount=0.1
      IntensityEffect=2

      [Colors:Button]
      BackgroundAlternate=184,226,245
      BackgroundNormal=225,245,252
      DecorationFocus=32,153,224
      DecorationHover=77,190,238
      ForegroundActive=16,93,159
      ForegroundInactive=93,117,127
      ForegroundLink=0,102,204
      ForegroundNegative=190,50,50
      ForegroundNeutral=190,120,20
      ForegroundNormal=20,52,66
      ForegroundPositive=35,130,65
      ForegroundVisited=92,75,160

      [Colors:Selection]
      BackgroundAlternate=20,136,205
      BackgroundNormal=40,163,226
      DecorationFocus=103,207,255
      DecorationHover=138,221,255
      ForegroundActive=255,255,255
      ForegroundInactive=220,242,250
      ForegroundLink=220,245,255
      ForegroundNegative=255,190,190
      ForegroundNeutral=255,235,170
      ForegroundNormal=255,255,255
      ForegroundPositive=200,255,210
      ForegroundVisited=235,220,255

      [Colors:View]
      BackgroundAlternate=235,248,251
      BackgroundNormal=248,253,255
      DecorationFocus=31,159,225
      DecorationHover=79,193,237
      ForegroundActive=20,100,165
      ForegroundInactive=102,121,130
      ForegroundLink=0,105,205
      ForegroundNegative=190,45,45
      ForegroundNeutral=185,115,10
      ForegroundNormal=18,48,61
      ForegroundPositive=31,128,62
      ForegroundVisited=91,70,160

      [Colors:Window]
      BackgroundAlternate=205,237,247
      BackgroundNormal=236,249,252
      DecorationFocus=28,153,221
      DecorationHover=77,190,235
      ForegroundActive=16,93,159
      ForegroundInactive=93,117,127
      ForegroundLink=0,102,204
      ForegroundNegative=190,50,50
      ForegroundNeutral=190,120,20
      ForegroundNormal=18,49,62
      ForegroundPositive=35,130,65
      ForegroundVisited=92,75,160

      [General]
      ColorScheme=Frutiger Aero
      Name=Frutiger Aero
      shadeSortColumn=true

      [KDE]
      contrast=4

      [WM]
      activeBackground=44,157,220
      activeBlend=182,231,249
      activeForeground=255,255,255
      inactiveBackground=205,234,243
      inactiveBlend=238,249,252
      inactiveForeground=55,85,98
    '';
  };

  frutigerAeroGlobalTheme = pkgs.symlinkJoin {
    name = "frutiger-aero-global-theme";
    paths = [
      (pkgs.writeTextDir "share/plasma/look-and-feel/org.kolby.frutiger-aero/metadata.json" (builtins.toJSON {
        KPlugin = {
          Authors = [
            {
              Email = "";
              Name = "Kolby";
            }
          ];
          Category = "";
          Description = "A bright Frutiger Aero profile for Plasma";
          Id = "org.kolby.frutiger-aero";
          License = "GPL-3.0-or-later";
          Name = "Frutiger Aero";
          Version = "1.0";
        };
        X-Plasma-APIVersion = "2";
      }))
      (pkgs.writeTextDir "share/plasma/look-and-feel/org.kolby.frutiger-aero/contents/defaults" ''
        [kdeglobals][General]
        ColorScheme=FrutigerAero

        [kdeglobals][Icons]
        Theme=Papirus

        [kdeglobals][KDE]
        AnimationDurationFactor=0.75
        SingleClick=false
        widgetStyle=Breeze

        [kcminputrc][Mouse]
        cursorSize=24
        cursorTheme=Breeze_Light

        [kwinrc][Compositing]
        Enabled=true
        LatencyPolicy=Low

        [kwinrc][Desktops]
        Number=4
        Rows=1

        [kwinrc][Plugins]
        blurEnabled=true
        contrastEnabled=true
        translucencyEnabled=true

        [kwinrc][Windows]
        ElectricBorders=1

        [plasmarc][Theme]
        name=breeze-light
      '')
    ];
  };
in
{
  desktopProfiles.kde.profiles.frutiger-aero = {
    packages = with pkgs; [
      frutigerAeroColors
      frutigerAeroGlobalTheme
      papirus-icon-theme
      plasma-panel-colorizer
    ];
  };
}
