{
  lib,
  pkgs,
  default-fonts,
  ...
}:

let
  font-sizes = {
    regular = 9;
    mono = 12;
  };
in
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.extraSpecialArgs = { inherit default-fonts font-sizes; };
  home-manager.users.rob = {
    imports = [
      ../../users/rob.nix

      ./mango.nix
      ../../desktops/mango/mango.nix

      ../../apps/augustus.nix
      ../../apps/blueman.nix
      ../../apps/distrobox.nix
      ../../apps/dogecoin.nix
      ../../apps/duckstation.nix
      ../../apps/legion-kb-rgb.nix
      ../../apps/libreoffice.nix
      ../../apps/musescore.nix
      ../../apps/openttd-jgrpp.nix
      ../../apps/qps.nix
      ../../apps/supercollider.nix
      ../../apps/swayidle.nix
      ../../apps/syncthing.nix
      ../../apps/tmux.nix
      ../../apps/wlopm.nix

      ../../lib/desktop-icons.nix
    ];

    custom.waybar.fontSizePx = 14;

    programs.tmux.extraConfig = lib.mkAfter ''
      set -g @nova-segment-battery "#(acpi | sed 's/Battery 0: //g')"
      set -g @nova-segment-battery-colors "#81a1c1 #2e3440"

      set -g @nova-segments-0-left ""
      set -g @nova-segments-0-right "cputemp battery clock"
    '';
    desktopIcons.packages = with pkgs; [
      augustus
      firefox
    ];
  };

  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };

  security.pam.services.gtklock.enable = true;
}
