{
  config,
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

      (import ../../desktops/dwl {
        config = config;
        pkgs = pkgs;
        default-fonts = default-fonts;
        font-sizes = font-sizes;
      })

      ../../apps/augustus.nix
      ../../apps/ch57x-keyboard-tool.nix
      ../../apps/distrobox.nix
      ../../apps/dogecoin.nix
      ../../apps/duckstation.nix
      ../../apps/kanshi.nix
      ../../apps/libreoffice.nix
      ../../apps/mpd.nix
      ../../apps/musescore.nix
      ../../apps/openttd-jgrpp.nix
      ../../apps/qps.nix
      ../../apps/supercollider.nix
      ../../apps/swayidle.nix
      ../../apps/syncthing.nix
      ../../apps/tmux.nix
      ../../apps/wlopm.nix

      # ./hyprland.nix
      ../../lib/desktop-icons.nix
    ];

    custom.waybar.fontSizePx = 11;

    programs.tmux.extraConfig = lib.mkAfter ''
      set -g @nova-segments-0-left ""
      set -g @nova-segments-0-right "cputemp clock"
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
