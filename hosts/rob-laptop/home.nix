{ lib, pkgs, ... }:

let
  font-sizes = {
    regular = 9;
    mono = 12;
    foot = 12;
  };
in
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      (import ../../users/rob.nix {
        pkgs = pkgs;
        font-sizes = font-sizes;
      })

      (import ../../desktops/labwc.nix {
        pkgs = pkgs;
        font-sizes = font-sizes;
      })

      ../../apps/augustus.nix
      ../../apps/openttd-jgrpp.nix
      ../../apps/supercollider.nix
      ../../apps/syncthing.nix
      ../../apps/tmux.nix

      ./labwc.nix
    ];

    custom.waybar.fontSizePx = 14;

    programs.tmux.extraConfig = lib.mkAfter ''
      set -g @nova-segment-battery "#(acpi | sed 's/Battery 0: //g')"
      set -g @nova-segment-battery-colors "#81a1c1 #2e3440"

      set -g @nova-segments-0-left ""
      set -g @nova-segments-0-right "cputemp battery clock"
    '';
  };

  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };
}
