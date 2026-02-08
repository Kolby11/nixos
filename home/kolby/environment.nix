{ pkgs, ... }:

{
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "18";
  };
}