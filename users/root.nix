{ ... }:

{
  imports = [
    ../apps/helix.nix
    ../apps/htop.nix
    ../apps/starship.nix
  ];
  home.username = "root";
  home.homeDirectory = "/root";
  home.stateVersion = "25.11";
}
