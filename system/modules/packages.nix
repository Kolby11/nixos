
{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    cmake
    home-manager
    btop
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

