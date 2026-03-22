{ pkgs, ... }:

{
  home.packages = with pkgs; [ lxqt.qps ];
}
