{ pkgs, ... }:

let
  memphis98 = import ../themes/memphis98.nix { inherit pkgs; };
in
{
  imports = [
    ../apps/foot.nix
    ../apps/helix.nix
    ../apps/kanshi.nix
    ../apps/labwc.nix
    ../apps/mpd.nix
    ../apps/starship.nix
    ../apps/tmux.nix
    ../apps/waybar.nix
    ../apps/wofi.nix
  ];

  home.username = "rob";
  home.homeDirectory = "/home/rob";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
    gvfs
    lxqt.pcmanfm-qt
    memphis98
    nwg-menu
    pavucontrol
    wl-clipboard
  ];

  programs.bash.enable = true;
  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.lazygit.enable = true;

  gtk = {
    enable = true;
    iconTheme = {
      name = "Memphis98";
      package = memphis98;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    qt5ctSettings = {
      Appearance = {
        icon_theme = "Memphis98";
      };
    };
    qt6ctSettings = {
      Appearance = {
        icon_theme = "Memphis98";
      };
    };
  };
}
