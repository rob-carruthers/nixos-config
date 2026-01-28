{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    legion-kb-rgb = {
      url = "github:4JX/L5P-Keyboard-RGB";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      legion-kb-rgb,
      ...
    }:
    let
      system = "x86_64-linux";
      unstablePkgs = import nixpkgs-unstable {
        inherit system;
      };
      fonts = import ./config/fonts.nix;
      mkNixosConfig =
        name:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit unstablePkgs;
            default-fonts = fonts.defaults;
          };
          modules = [
            ./configuration.nix
            ./hosts/${name}/configuration.nix
            (
              { pkgs, ... }:
              {
                fonts.packages = fonts.packages pkgs;
              }
            )
            {
              nix = {
                settings.experimental-features = [
                  "nix-command"
                  "flakes"
                ];
              };
            }
            home-manager.nixosModules.home-manager
            (
              { ... }:
              {
                nixpkgs.overlays = [
                  self.overlays.legion-kb-rgb
                  (import ./overlays/memphis98.nix)
                  (import ./overlays/ch57x-keyboard-tool.nix)
                ];
              }
            )
          ];
        };
    in
    {
      overlays.legion-kb-rgb = final: prev: {
        legion-kb-rgb = legion-kb-rgb.packages.${final.stdenv.hostPlatform.system}.default;
      };

      nixosConfigurations = {
        rob-pc = mkNixosConfig "rob-pc";
        rob-laptop = mkNixosConfig "rob-laptop";
        "robcarruthers.co.uk" = mkNixosConfig "robcarruthers.co.uk";
      };
    };
}
