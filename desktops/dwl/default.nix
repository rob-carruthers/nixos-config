{
  config,
  pkgs,
  default-fonts,
  font-sizes,
}:

{
  imports = [
    (import ./dwl.nix {
      config = config;
      pkgs = pkgs;
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
  ];
}
