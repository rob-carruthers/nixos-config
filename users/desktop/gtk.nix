{
  pkgs,
  default-fonts,
  font-sizes,
  ...
}:

{
  gtk = {
    enable = true;
    font = {
      name = "${default-fonts.regular}";
      size = font-sizes.regular;
    };
    iconTheme = {
      name = "Memphis98";
      package = pkgs.memphis98;
    };
  };
}
