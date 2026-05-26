
{ config, pkgs, pkgs-unstable, ... }:

{
  environment.systemPackages = with pkgs-unstable; [
    btop
    fastfetch
    ripgrep
    home-manager
    git
    killall
    vim
    neovim
    openssl
    openssl.dev
    pkg-config
    wget
    stow
    eza
  ];
}
