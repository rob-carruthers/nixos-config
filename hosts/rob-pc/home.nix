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
  };
  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };
}
