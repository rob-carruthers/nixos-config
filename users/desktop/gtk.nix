{ pkgs, ... }:

let
  memphis98 = import ../../themes/memphis98.nix { inherit pkgs; };
in
{
  gtk = {
    enable = true;
    iconTheme = {
      name = "Memphis98";
      package = memphis98;
    };
  };
}
