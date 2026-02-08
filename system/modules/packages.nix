
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmake
    btop
    fastfetch
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
  ];
}

