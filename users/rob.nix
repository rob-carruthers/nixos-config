{ config, pkgs, ... }:

{
  imports = [
    ../apps/foot.nix
    ../apps/helix.nix
    ../apps/labwc.nix
    ../apps/starship.nix
    ../apps/tmux.nix
    ../apps/wofi.nix
  ];
  home.username = "rob";
  home.homeDirectory = "/home/rob";

  home.stateVersion = "25.11";

  programs.bash.enable = true;
  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.lazygit.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
