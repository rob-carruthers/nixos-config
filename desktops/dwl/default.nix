{
  pkgs,
  default-fonts,
  font-sizes,
}:

{
  imports = [
    (import ./dwl.nix {
      pkgs = pkgs;
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
  ];
}
