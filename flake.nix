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
    inputs@{
      self,
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
    in
    {
      nixosConfigurations = {
        rob-pc = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit unstablePkgs;
          };
          modules = [
            ./configuration.nix
            ./hosts/rob-pc/configuration.nix
            {
              nix = {
                settings.experimental-features = [
                  "nix-command"
                  "flakes"
                ];
              };
            }
            home-manager.nixosModules.home-manager
          ];
        };
        rob-laptop = nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit unstablePkgs;
          };
          modules = [
            ./configuration.nix
            ./hosts/rob-laptop/configuration.nix
            {
              nix = {
                settings.experimental-features = [
                  "nix-command"
                  "flakes"
                ];
              };
            }
            home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
