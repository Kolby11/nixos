{
  description = "Mato NixOS";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
      nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
      home-manager = {
        url = "github:nix-community/home-manager/release-25.05";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      quickshell = {
        url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
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
      elegant-grub2-themes.url = "github:kolby11/elegant-grub2-themes";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, elegant-grub2-themes, ... }@inputs:
  let 
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      pkgs-unstable = nixpkgs-unstable.legacyPackages.${system};
  in
  {
    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
        modules = [
          ./system/configuration.nix
          elegant-grub2-themes.nixosModules.default
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