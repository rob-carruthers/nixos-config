{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      ../../users/rob.nix

      ../../apps/foot.nix
      ../../apps/helix.nix
      ../../apps/kanshi.nix
      ../../apps/labwc.nix
      ../../apps/mpd.nix
      ../../apps/pcmanfm-qt.nix
      ../../apps/starship.nix
      ../../apps/tmux.nix
      ../../apps/waybar.nix
      ../../apps/wofi.nix
    ];
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
    wayland.windowManager.labwc.environment = [
      "XKB_DEFAULT_LAYOUT=us"
    ];

    custom.waybar.fontSizePx = 11;

    programs.foot.settings.main.font = "JetBrainsMono Nerd Font Mono:size=9";
  };

  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };
}
