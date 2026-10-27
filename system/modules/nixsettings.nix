{ config, lib, pkgs, ... }:

let
  pruneSystemGenerations = pkgs.writeShellScript "prune-system-generations" ''
    set -euo pipefail
    generations=$(${config.nix.package}/bin/nix-env --profile /nix/var/nix/profiles/system --list-generations)
    current=$(printf '%s\n' "$generations" | ${pkgs.gawk}/bin/awk '/\(current\)/ { print $1 }')
    if [[ ! "$current" =~ ^[0-9]+$ ]]; then
      echo "Cannot identify the current system generation; refusing to prune." >&2
      exit 1
    fi
    # Preserve the selected generation even after a rollback, plus the two newest others.
    mapfile -t obsolete < <(printf '%s\n' "$generations" \
      | ${pkgs.coreutils}/bin/sort -k1,1nr \
      | ${pkgs.gawk}/bin/awk -v current="$current" '$1 != current && ++kept > 2 { print $1 }')
    if (( ''${#obsolete[@]} > 0 )); then
      ${config.nix.package}/bin/nix-env --profile /nix/var/nix/profiles/system \
        --delete-generations "''${obsolete[@]}"
    fi
  '';
in

{
	documentation.nixos.enable = false;

	nixpkgs.config.allowUnfree = true;

	nix = {
		settings = {
			warn-dirty = false;
			experimental-features = [ "nix-command" "flakes" ];
			auto-optimise-store = true;
			max-jobs = 4;
			cores = 4;
			substituters = ["https://nix-gaming.cachix.org"];
			trusted-public-keys = ["nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="];
		};

		gc = {
			automatic = true;
			dates = "weekly";
			options = "";
			persistent = true;
		};
	};

  boot.loader.grub.configurationLimit = 3;
  boot.loader.grub.extraInstallCommands = lib.mkBefore ''
    ${pruneSystemGenerations}
  '';
  systemd.services.nix-gc.preStart = "${pruneSystemGenerations}";
}
