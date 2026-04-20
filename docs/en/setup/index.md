# Setup

## Initial setup

Run the interactive `./setup` script from the repository root. It discovers existing machine configurations and lets you select or create one:

```bash
./setup
```

The script:
1. Lists all existing configurations under `system/configurations/`
2. Prompts you to select one, or choose **"Create new configuration"**
3. Writes the selected device name to `.setup` (this file is gitignored)

`.setup` contains a single line: `DEVICE=<name>`. The `./rebuild` script reads it to know which flake output to build.

## Rebuilding

After making any changes to the configuration:

```bash
./rebuild
```

This runs:

```bash
sudo nixos-rebuild switch --flake .#<DEVICE>
```

where `<DEVICE>` is read from `.setup`.

## Adding a new machine

Run `./setup` and choose **"Create new configuration"**. Enter a machine name (spaces become hyphens). The script will automatically:

- Run `nixos-generate-config` and save the result to `system/configurations/<name>/hardware-config.nix`
- Create a `system/configurations/<name>/default.nix` stub
- Register the machine in `system/configurations/default.nix` (adds the `lib.optionals` line)
- Add it to `nixosConfigurations` in `flake.nix`

After creation, edit `system/configurations/<name>/` to add device-specific hardware overrides (GPU drivers, kernel modules, etc.), then run `./rebuild`.

See [Machine Configurations](/system/configurations/) for examples of how desktop and legion are structured.

## Home Manager

The Home Manager configuration is maintained separately from the system rebuild. To apply Home Manager changes:

```bash
home-manager switch --flake .#kolby
```

Home Manager does **not** require `sudo` and does **not** affect the system configuration.

## Updating flake inputs

To update all flake inputs to their latest commits:

```bash
nix flake update
```

To update a single input (e.g., only nixpkgs-unstable):

```bash
nix flake update nixpkgs-unstable
```

After updating, run `./rebuild` to apply.
