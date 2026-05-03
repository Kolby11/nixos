{
  description = "Mato NixOS";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    elegant-grub2-themes = {
      url = "github:kolby11/elegant-grub2-themes";
    };
    kew = {
      url = "github:kolby11/kew";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    claude-code.url = "github:sadjow/claude-code-nix";
    codex-cli-nix.url = "github:sadjow/codex-cli-nix";
    yazi.url = "github:sxyazi/yazi";
    eza.url = "github:eza-community/eza";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

  };
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, elegant-grub2-themes, ... }@inputs:
  let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    pkgs-unstable = import nixpkgs-unstable {
      inherit system;
      config.allowUnfree = true;
    };
    mkSystem = device: lib.nixosSystem {
      inherit system;
      modules = [
        ./system/configuration.nix
        elegant-grub2-themes.nixosModules.default
      ];
      specialArgs = {
        inherit pkgs-unstable inputs device;
      };
    };
  in
  {
    nixosConfigurations = {
      desktop = mkSystem "desktop";
      legion = mkSystem "legion";
    };
    homeConfigurations = {
      kolby = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/kolby
          ({ pkgs, ... }: {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [ inputs.claude-code.overlays.default ];
            home.packages = [
              (inputs.yazi.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
                _7zz = pkgs._7zz-rar;
              })
            ];
          })
        ];
        extraSpecialArgs = {
          inherit pkgs-unstable;
          inherit inputs;
          context = self;
          runtimeRoot = "/home/kolby/.config";
          hm = home-manager.lib.hm;
        };
      };
    };
  };
}
