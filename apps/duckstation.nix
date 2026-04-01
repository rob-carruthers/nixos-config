{ pkgs, ... }:

{
  home.packages = with pkgs; [
    duckstation
  ];
}
