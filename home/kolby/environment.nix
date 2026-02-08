{ pkgs, ... }:

{
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
    HYPRCURSOR_SIZE = "18";
  };
}