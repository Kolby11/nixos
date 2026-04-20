# Programs

Configured Home Manager programs in `home/kolby/programs.nix`.

<<< @/../home/kolby/programs.nix

## home-manager

`programs.home-manager.enable = true` makes Home Manager manage itself. This is the standard bootstrap that allows running `home-manager switch` without a system-level Home Manager installation.

## yazi

[Yazi](https://yazi-rs.github.io/) is a terminal file manager with async I/O, image previews, and plugin support. It is installed from the custom `yazi` flake input (which tracks upstream HEAD) rather than nixpkgs.

The `_7zz-rar` override adds RAR archive support to the `7zz` archiver that Yazi uses for archive previews. The standard `7zz` package does not include RAR support due to licensing restrictions; `_7zz-rar` is the variant that includes the RAR codec.
