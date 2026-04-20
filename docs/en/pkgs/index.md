# Custom Packages

Custom Nix package derivations live under `pkgs/`. They are collected in `pkgs/default.nix`:

<<< @/../pkgs/default.nix

This file is imported by passing `{ inherit pkgs; }` where needed:

```nix
let
  customPkgs = import ../../../pkgs { inherit pkgs; };
in
# customPkgs.material-symbols, customPkgs.illogical-impulse-oneui4-icons
```

## Why custom packages?

Both packages are either unavailable in nixpkgs or the nixpkgs version is not suitable:

| Package | Reason for custom derivation |
|---------|------------------------------|
| `material-symbols` | The nixpkgs version may lag behind; this pins a specific git commit of Google's repo and strips the verbose filename suffix |
| `illogical-impulse-oneui4-icons` | Fork of an icon theme that is not in nixpkgs; requires patches to fix broken symlinks and missing index.theme sections |
