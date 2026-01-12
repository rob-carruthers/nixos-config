{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lxqt.pcmanfm-qt
  ];

  home.file."Pictures/background.jpg" = {
    source = ../assets/brighton_pier_sunset-wallpaper-1920x1080.jpg;
  };
}
