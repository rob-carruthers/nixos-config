{ pkgs, font-sizes, ... }:

let
  memphis98 = import ../../themes/memphis98.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    font = {
      name = "Noto Sans Regular";
      size = font-sizes.regular;
    };
    iconTheme = {
      name = "Memphis98";
      package = memphis98;
    };
  };
}
