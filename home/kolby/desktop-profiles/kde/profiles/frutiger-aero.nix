{ pkgs, ... }:

let
  wallpaper = pkgs.nixos-artwork.wallpapers.watersplash.kdeFilePath;
in
{
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
  };
}
