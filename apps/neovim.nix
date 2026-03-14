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
    gnumake
    lua-language-server
    ripgrep
    tree-sitter
    unzip
  ];
}
