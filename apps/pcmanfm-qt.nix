{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lxqt.pcmanfm-qt
  ];

  xdg.configFile."pcmanfm-qt/default/settings.conf".source = ./files/pcmanfm-qt/settings.conf;

  home.file."Pictures/background.jpg" = {
    source = ../assets/brighton_pier_sunset-wallpaper-1920x1080.jpg;
  };
}
