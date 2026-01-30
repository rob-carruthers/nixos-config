{
  lib,
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

      (import ../../desktops/labwc.nix {
        pkgs = pkgs;
        default-fonts = default-fonts;
        font-sizes = font-sizes;
      })

      ../../apps/augustus.nix
      ../../apps/ch57x-keyboard-tool.nix
      ../../apps/kanshi.nix
      ../../apps/mpd.nix
      ../../apps/openttd-jgrpp.nix
      ../../apps/supercollider.nix
      ../../apps/syncthing.nix
      ../../apps/tmux.nix

      ./labwc.nix
    ];

    custom.waybar.fontSizePx = 11;

    programs.tmux.extraConfig = lib.mkAfter ''
      set -g @nova-segments-0-left ""
      set -g @nova-segments-0-right "cputemp clock"
    '';
  };

  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };
}
