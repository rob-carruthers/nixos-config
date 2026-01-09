{ config, pkgs, ... }:

{
  imports = [
    ./apps/foot.nix
    ./apps/helix.nix
    ./apps/labwc.nix
    ./apps/starship.nix
    ./apps/tmux.nix
    ./apps/wofi.nix
  ];
  home.username = "rob";
  home.homeDirectory = "/home/rob";

  home.stateVersion = "25.11";

  programs.git.enable = true;
  programs.bash.enable = true;
  programs.firefox.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
  ];
}
