{ pkgs, ... }:

let
  memphis98 = import ../themes/memphis98.nix { inherit pkgs; };
in
{
  imports = [
    ../apps/htop.nix
    ../config/qt.nix
    ../config/gtk.nix
  ];

  home.username = "rob";
  home.homeDirectory = "/home/rob";
  home.stateVersion = "25.11";

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

  home.packages = with pkgs; [
    brightnessctl
    gvfs
    memphis98
    nwg-menu
    pavucontrol
    pulsemixer
    wl-clipboard
  ];

  programs.bash.enable = true;
  programs.firefox.enable = true;
  programs.git.enable = true;
  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        edit = "hx {{filename}}";
        editAtLine = "hx {{filename}}:{{line}}";
      };
    };
  };

}
