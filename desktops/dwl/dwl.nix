{
  pkgs,
  default-fonts,
  font-sizes,
  ...
}:

let
  dwlCustom =
    (pkgs.dwl.override {
      configH = ./config.h;
    }).overrideAttrs
      (old: {
        patches = (old.patches or [ ]) ++ [
          ./patches/attachbottom.patch
          ./patches/gaps.patch
        ];
      });
in
{
  imports = [
    ../../apps/firefox.nix
    (import ../../apps/foot.nix {
      pkgs = pkgs;
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
    (import ../../apps/ghostty.nix {
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
    ../../apps/pcmanfm-qt.nix
    ../../apps/waybar.nix
    ../../apps/wofi.nix
  ];

  home.packages = with pkgs; [
    brightnessctl
    gvfs
    memphis98
    nwg-menu
    pavucontrol
    pulsemixer
    syncthingtray
    wl-clipboard

    dwlCustom
  ];

  home.pointerCursor = {
    enable = true;
    name = "graphite-dark-nord";
    package = pkgs.graphite-cursors;
  };
}
