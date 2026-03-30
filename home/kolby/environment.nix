{ pkgs, ... }:

{
  home.sessionVariables = {
    DOTNET_ROOT = "${pkgs.dotnet-sdk}";
  };

  home.sessionPath = [ "$HOME/.cargo/bin" ];
}