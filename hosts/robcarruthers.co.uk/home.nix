{
  pkgs,
  default-fonts,
  ...
}:

let
  font-sizes = {
    regular = 8;
    mono = 9;
  };
in
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      (import ../../users/rob.nix {
        pkgs = pkgs;
        default-fonts = default-fonts;
        font-sizes = font-sizes;
      })

      ../../apps/tmux.nix
    ];
  };

  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };
}
