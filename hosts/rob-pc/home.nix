{ lib, ... }:

{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      ../../users/rob.nix

      ../../desktops/labwc.nix

      ../../apps/augustus.nix
      ../../apps/kanshi.nix
      ../../apps/mpd.nix
      ../../apps/openttd-jgrpp.nix
      ../../apps/supercollider.nix
      ../../apps/syncthing.nix
      ../../apps/tmux.nix

      ./labwc.nix
    ];

    gtk.font = {
      size = 8;
    };

    qt.qt5ctSettings = {
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,8\"";
      };
    };
    qt.qt6ctSettings = {
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,8\"";
      };
    };

    custom.waybar.fontSizePx = 11;

    programs.foot.settings.main.font = "JetBrainsMono Nerd Font Mono:size=9";

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
