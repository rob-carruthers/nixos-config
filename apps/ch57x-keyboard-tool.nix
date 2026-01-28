{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ch57x-keyboard-tool
  ];
}
