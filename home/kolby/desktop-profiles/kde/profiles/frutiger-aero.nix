{ config, lib, pkgs, ... }:

let
  templateRoot = ".local/share/desktop-profile-templates/kde/frutiger-aero";
  wallpaper = pkgs.nixos-artwork.wallpapers.watersplash.kdeFilePath;
in
{
  home.file = {
    "${templateRoot}/kdeglobals".text = ''
      [General]
      ColorScheme=FrutigerAero
      TerminalApplication=konsole

      [Icons]
      Theme=Papirus

      [KDE]
      AnimationDurationFactor=0.75
      LookAndFeelPackage=org.kde.breeze.desktop
      SingleClick=false
      widgetStyle=Breeze

      [WM]
      activeBackground=44,157,220
      activeForeground=255,255,255
      inactiveBackground=205,234,243
      inactiveForeground=55,85,98
    '';

    "${templateRoot}/kwinrc".text = ''
      [Compositing]
      Enabled=true
      LatencyPolicy=Low

      [Desktops]
      Number=4
      Rows=1

      [Plugins]
      blurEnabled=true
      contrastEnabled=true
      translucencyEnabled=true

      [Windows]
      ElectricBorders=1
    '';

    "${templateRoot}/plasmarc".text = ''
      [Theme]
      name=breeze-light
    '';

    "${templateRoot}/kcminputrc".text = ''
      [Mouse]
      cursorTheme=Breeze_Light
      cursorSize=24
    '';

    # KDE profiles have their own XDG_CONFIG_HOME, so expose Plasma Manager's
    # shared startup runner inside this profile as well.
    "${templateRoot}/autostart/plasma-manager-autostart.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Apply declarative Plasma layout
      Exec=${config.xdg.dataHome}/plasma-manager/run_all.sh
      OnlyShowIn=KDE;
      X-KDE-autostart-phase=2
    '';
  };

  programs.plasma = {
    enable = true;

    workspace = {
      wallpaper = wallpaper;
      wallpaperFillMode = "preserveAspectCrop";
    };

    panels = [
      {
        location = "bottom";
        height = 46;
        floating = true;
        opacity = "adaptive";
        widgets = [
          {
            kickoff = {
              icon = "nix-snowflake-white";
              sortAlphabetically = true;
            };
          }
          "org.kde.plasma.pager"
          "org.kde.plasma.icontasks"
          "org.kde.plasma.marginsseparator"
          "org.kde.plasma.systemtray"
          {
            digitalClock = {
              date.enable = true;
              time.format = "24h";
              calendar.firstDayOfWeek = "monday";
            };
          }
          "org.kde.plasma.showdesktop"
        ];
      }
    ];

    # Each KDE login profile has independent Plasma state. Reapply this layout
    # on login instead of sharing Plasma Manager's global one-shot marker.
    startup.desktopScript = {
      panels = {
        runAlways = true;
        # Plasma Manager normally removes the applet state under the primary
        # ~/.config. This session keeps it under an isolated XDG_CONFIG_HOME.
        preCommands = lib.mkForce "";
      };
      wallpaper_picture.runAlways = true;
    };
  };
}
