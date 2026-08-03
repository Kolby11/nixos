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
    # NOTE: do not make nixpkgs follow ours — upstream references top-level
    # `libX11` which only resolves against its own pinned nixpkgs.
    codex-desktop-linux.url = "github:ilysenko/codex-desktop-linux";
    eza.url = "github:eza-community/eza";
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    illogical-flake = {
      url = "github:soymou/illogical-flake";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    zen-browser = {
      url = "github:youwen5/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
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
      config.permittedInsecurePackages = [ "pnpm-10.29.2" ];
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
      hp = mkSystem "hp";
    };
    homeConfigurations = {
      kolby = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./home/kolby
          ({ pkgs, ... }: {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [ inputs.claude-code.overlays.default ];
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
