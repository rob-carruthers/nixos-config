{
  pkgs,
  default-fonts,
  font-sizes,
  ...
}:

{
  imports = [
    ../apps/direnv.nix
    ../apps/helix.nix
    ../apps/htop.nix
    ../apps/starship.nix
    (import ./desktop/gtk.nix {
      pkgs = pkgs;
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
    (import ./desktop/qt.nix {
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
  ];

  home.username = "rob";
  home.homeDirectory = "/home/rob";
  home.stateVersion = "25.11";
  home.sessionPath = [ "$HOME/.local/bin" ];
  home.sessionVariables = {
    EDITOR = "hx";
    SUDO_EDITOR = "hx";
    VISUAL = "hx";
  };

  xdg.userDirs = {
    enable = true;
    createDirectories = true;
  };

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

  programs.bash = {
    enable = true;
    initExtra = "eval \"$(direnv hook bash)\"";
  };

}
