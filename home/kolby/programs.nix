{ pkgs, inputs, ... }:

{
  programs = {
    home-manager.enable = true;
    yazi = {
      enable = true;
      package = inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
        _7zz = pkgs._7zz-rar;
      };
    };
  };
}
