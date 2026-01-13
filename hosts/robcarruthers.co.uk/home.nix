{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      ../../users/rob.nix

      ../../apps/helix.nix
      ../../apps/tmux.nix
    ];
  };

  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };
}
