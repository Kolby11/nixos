{ pkgs, inputs, ... }:

{
  programs = {
    home-manager.enable = true;
    yazi = {
      enable = true;
      package = inputs.yazi.packages.${pkgs.system}.default.override {
        _7zz = pkgs._7zz-rar;
      };
    };
  };
}