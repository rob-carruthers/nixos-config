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
      nixpkgs,
      nixpkgs-unstable,
      home-manager,
      legion-kb-rgb,
      ...
    }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      overlays = import ./lib/overlays.nix {
        inherit legion-kb-rgb;
      };
      pkgs = import nixpkgs {
        inherit system overlays;
      };
      fonts = import ./config/fonts.nix;
      mkNixosConfig = import ./lib/mkNixosConfig.nix {
        inherit
          lib
          nixpkgs
          nixpkgs-unstable
          home-manager
          overlays
          fonts
          system
          ;
      };
    in
    {
      nixosConfigurations = {
        rob-pc = mkNixosConfig "rob-pc";
        rob-laptop = mkNixosConfig "rob-laptop";
        robcarruthers = mkNixosConfig "robcarruthers";
      };
    };
}
