# Programy

Nakonfigurované Home Manager programy v `home/kolby/programs.nix`.

<<< @/../home/kolby/programs.nix

## home-manager

`programs.home-manager.enable = true` umožňuje Home Manageru spravovať seba samého. To je štandardná bootstrap konfigurácia, aby bolo možné spustiť `home-manager switch` bez systémovej inštalácie Home Managera.

## yazi

[Yazi](https://yazi-rs.github.io/) je terminálový správca súborov s asynchrónnym I/O, náhľadmi obrázkov a podporou pluginov. Inštaluje sa z vlastného flake inputu `yazi` (ktorý sleduje upstream HEAD) namiesto nixpkgs.

Override `_7zz-rar` pridáva podporu RAR archívov do archiveru `7zz`, ktorý Yazi používa pre náhľady archívov. Štandardný `7zz` balík neobsahuje RAR kvôli licenčným obmedzeniam; `_7zz-rar` je varianta, ktorá obsahuje RAR kodek.
