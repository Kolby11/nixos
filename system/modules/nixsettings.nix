{ config, pkgs, ... }:

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
			options = "--delete-older-than 7d";
		};
	};
}
