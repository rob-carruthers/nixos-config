{ pkgs, ... }:

{
  # All packages required for neovim should be system pkgs. Home-manager neovim tries to use a
  # local nvim-treesitter instead of a plugin-declared one.
  environment.systemPackages = with pkgs; [
    curl
    fd
    gcc
    gnumake
    lua-language-server
    neovim
    ripgrep
    skim
    stylua
    tree-sitter
    unzip
  ];
}
