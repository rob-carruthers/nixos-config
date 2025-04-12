{
  description = "Flake-based NixOS configuration for VM and other hosts";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    let
      system = "x86_64-linux";
    in {
      nixosConfigurations = {
        vm = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/vm.nix
          ];
        };
      };
    };
}
