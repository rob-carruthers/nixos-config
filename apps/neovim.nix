{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    curl
    fd
    # fzf
    gcc
    lua-language-server
    ripgrep
    unzip
  ];
}
