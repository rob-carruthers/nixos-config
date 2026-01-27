{ pkgs, font-sizes, ... }:

{
  gtk = {
    enable = true;
    font = {
      name = "Noto Sans Regular";
      size = font-sizes.regular;
    };
    iconTheme = {
      name = "Memphis98";
      package = pkgs.memphis98;
    };
  };
}
