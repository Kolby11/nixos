# Material Symbols

Custom derivation for Google's Material Symbols variable font, in `pkgs/material-symbols/default.nix`.

<<< @/../pkgs/material-symbols/default.nix

## What it installs

The derivation fetches a specific commit of `google/material-design-icons` from GitHub (sparse checkout of only the `variablefont/` directory) and installs the `.ttf` variable font files to `$out/share/fonts/TTF/`.

The `rename` tool strips the `[FILL,GRAD,opsz,wght]` suffix from filenames — Google's source files have these axis descriptors appended, e.g. `MaterialSymbolsOutlined[FILL,GRAD,opsz,wght].ttf`. After renaming the file becomes `MaterialSymbolsOutlined.ttf`.

## Why variable fonts?

Material Symbols are distributed as OpenType variable fonts with four axes: Fill, Grade, Optical Size, and Weight. A single variable font file covers all icon styles and weights, unlike the older Material Icons which required separate files per style.

## Usage

This package is added to `fonts.packages` in `system/desktops/hyprland/ii-shell.nix` at the system level (so SDDM and all sessions can see it), and also installed via Home Manager in `home/kolby/fonts.nix`.

::: info
The system-level install in `ii-shell.nix` is what makes the font visible to fontconfig. Home Manager alone is not sufficient because fontconfig needs the font in a system path for QuickShell (which runs as a user service) to find it reliably.
:::
