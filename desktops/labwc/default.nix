{
  pkgs,
  default-fonts,
  font-sizes,
}:

{
  imports = [
    (import ./labwc.nix {
      pkgs = pkgs;
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
  ];
}
