{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
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
                  (import ./overlays/memphis98.nix)
                ];
              }
            )
          ];
        };
    in
    {
      nixosConfigurations = {
        rob-pc = mkNixosConfig "rob-pc";
        rob-laptop = mkNixosConfig "rob-laptop";
        "robcarruthers.co.uk" = mkNixosConfig "robcarruthers.co.uk";
      };
    };
}
