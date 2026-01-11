{ pkgs, ... }:

let
  memphis98 = import ../themes/memphis98.nix { inherit pkgs; };
in
{
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
  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        edit = "hx {{filename}}";
        editAtLine = "hx {{filename}}:{{line}}";
      };
    };
  };

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
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,8\"";
      };
    };
    qt6ctSettings = {
      Appearance = {
        icon_theme = "Memphis98";
      };
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,8\"";
      };
    };
  };
}
