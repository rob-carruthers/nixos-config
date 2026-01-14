{
  imports = [
    ../apps/helix.nix
    ../apps/htop.nix
    ../apps/starship.nix
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

  programs.bash.enable = true;
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
