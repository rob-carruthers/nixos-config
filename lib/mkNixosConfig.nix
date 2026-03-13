{
  lib,
  nixpkgs,
  nixpkgs-unstable,
  home-manager,
  overlays,
  fonts,
  system,
  inputs,
}:

name:

let
  unstablePkgs = import nixpkgs-unstable {
    inherit system overlays;
  };
in
lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit inputs unstablePkgs;
    default-fonts = fonts.defaults;
  };

  modules = [
    ../configuration.nix
    ../hosts/${name}/configuration.nix

    (
      { pkgs, ... }:
      {
        fonts.packages = fonts.packages pkgs;
      }
    )

    {
      nix.settings.experimental-features = [
        "nix-command"
        "flakes"
      ];
    }

    home-manager.nixosModules.home-manager

    {
      home-manager.extraSpecialArgs = {
        inherit inputs unstablePkgs;
      };
    }

    {
      nixpkgs.overlays = overlays;
    }
  ];
}
