{ lib, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      ../../users/rob.nix

      ../../desktops/labwc.nix

      ../../apps/augustus.nix
      ../../apps/openttd-jgrpp.nix
      ../../apps/supercollider.nix
      ../../apps/syncthing.nix
      ../../apps/tmux.nix

      ./labwc.nix
    ];

    gtk.font = {
      name = "Noto Sans Regular";
      size = 9;
    };

    qt.qt5ctSettings = {
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,9\"";
      };
    };
    qt.qt6ctSettings = {
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,9\"";
      };
    };

    custom.waybar.fontSizePx = 14;

    programs.foot.settings.main.font = "JetBrainsMono Nerd Font Mono:size=12";

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
