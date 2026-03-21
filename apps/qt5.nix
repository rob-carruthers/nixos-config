{ pkgs, ... }:

{
  home.packages = with pkgs; [
    qt5.qtbase
    qt5.qtwayland
  ];
}
