{ config, pkgs, lib, ... }:

let
  configDir = ./config;
in
{
  home.file = {
    ".config/i3".source = "${configDir}/i3";
    ".config/polybar".source = "${configDir}/polybar";
    ".config/swayidle".source = "${configDir}/swayidle";
    ".config/btop".source = "${configDir}/btop";
    ".config/rofi".source = "${configDir}/rofi";
    ".config/mako".source = "${configDir}/mako";
    ".config/themes".source = "${configDir}/themes";
  };
}

