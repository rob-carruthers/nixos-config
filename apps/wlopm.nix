{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wlopm
  ];
}
