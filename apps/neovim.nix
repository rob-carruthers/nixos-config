{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
  };

  home.packages = with pkgs; [
    curl
    fd
    gcc
    gnumake
    lua-language-server
    ripgrep
    skim
    tree-sitter
    unzip
  ];
}
