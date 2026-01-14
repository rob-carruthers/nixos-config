{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      ../../users/rob.nix

      ../../apps/foot.nix
      ../../apps/helix.nix
      ../../apps/kanshi.nix
      ../../apps/labwc-base.nix
      ../../apps/mpd.nix
      ../../apps/pcmanfm-qt.nix
      ../../apps/tmux.nix
      ../../apps/waybar.nix
      ../../apps/wofi.nix

      ./labwc.nix
    ];

    gtk.font = {
      name = "Noto Sans Regular";
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
  };

  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };
}
