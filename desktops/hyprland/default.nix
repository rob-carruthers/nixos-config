{
  pkgs,
  default-fonts,
  font-sizes,
}:

{
  imports = [
    (import ./hyprland.nix {
      pkgs = pkgs;
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
  ];
}
