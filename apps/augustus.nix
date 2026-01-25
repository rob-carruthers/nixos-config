{ pkgs, ... }:

{
  home.packages = with pkgs; [
    augustus
  ];
}
