{ pkgs, ... }:

{
  home.packages = with pkgs; [
    lxqt.pcmanfm-qt
  ];
}
