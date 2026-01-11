{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    font-awesome_5
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];
}
