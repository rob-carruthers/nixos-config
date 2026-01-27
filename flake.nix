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
      mkNixosConfig =
        name:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = {
            inherit unstablePkgs;
          };
          modules = [
            ./configuration.nix
            ./hosts/${name}/configuration.nix
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
    in
    {
      nixosConfigurations = {
        rob-pc = mkNixosConfig "rob-pc";
        rob-laptop = mkNixosConfig "rob-laptop";
        "robcarruthers.co.uk" = mkNixosConfig "robcarruthers.co.uk";
      };
    };
}
