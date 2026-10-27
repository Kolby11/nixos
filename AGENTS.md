# Configuration rules

## Package placement

- Install personal applications and development tools for Kolby in
  `home/kolby/packages.nix` using `home.packages`, rather than adding them to
  the core system's `environment.systemPackages`.
- Reserve system packages for core system requirements and packages that belong
  to a system service or desktop integration. Hyprglass belongs in the Hyprland
  system module and is an explicit exception to user package placement.
- If it is unclear whether a package belongs in Kolby's user configuration or
  the system configuration, ask the user before adding it.
- Preserve existing package placement unless the task requests a migration.
