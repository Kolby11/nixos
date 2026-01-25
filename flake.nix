{
  description = "Mato NixOS";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
      nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      stylix = {
        url = "github:nix-community/stylix/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };

      caelestia-shell = {
        url = "github:caelestia-dots/shell";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
      };
      caelestia-cli = {
        url = "github:caelestia-dots/cli";
        inputs.nixpkgs.follows = "nixpkgs-unstable";
      };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, stylix, ... }@inputs:
  let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in
  {
    packages.${system}.elegant-grub-theme = pkgs.stdenv.mkDerivation rec {
      pname = "elegant-grub2-themes";
      version = "2025-03-25";

      src = pkgs.fetchFromGitHub {
        owner = "vinceliuice";
        repo = "elegant-grub2-themes";
        rev = "2025-03-25";
        sha256 = "sha256-M9k6R/rUvEpBTSnZ2PMv5piV50rGTBrcmPU4gsS7Byg=";
      };

      installPhase = ''
        set -e
        set -x

        echo "Installing Elegant GRUB theme into $out"
        chmod +x ./install.sh
        mkdir -p $out
        export BOOTDIR=$out

        # Run install.sh in Nix store
        bash ./install.sh -t mountain -p window -s 1080p

        echo "Listing installed theme:"
        ls -la $out
      '';
    };
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          stylix.nixosModules.stylix
          ./system/configuration.nix 
        ];
        specialArgs = {
          inherit pkgs-unstable;
          inherit inputs;
        };
      };
    };

    homeConfigurations = {
       kolby = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          stylix.homeModules.stylix 
          ./home/kolby ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
          inherit inputs;
          context = self;
          runtimeRoot = "/home/kolby/.config";
          hm = home-manager.lib.hm;
        };
      };
      mato = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          stylix.homeModules.stylix 
          ./home/mato ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
          inherit inputs;
          context = self;
          runtimeRoot = "/home/mato/.config";
          hm = home-manager.lib.hm;
        };
      };
    };
  };
}