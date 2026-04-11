{
  config,
  pkgs,
  default-fonts,
  font-sizes,
  ...
}:

let
  configMap = {
    rob-laptop = ./config.laptop.h;
    rob-pc = ./config.pc.h;
  };

  configH = configMap.${config.networking.hostName} or ./config.default.h;

  dwlCustom =
    (pkgs.dwl.override {
      inherit configH;
    }).overrideAttrs
      (old: {
        patches = (old.patches or [ ]) ++ [
          ./patches/attachbottom.patch
          ./patches/gaps.patch
          ./patches/autostart.patch
          ./patches/ipc.patch
          ./patches/dim-unfocused.patch
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
    (import ../../apps/qutebrowser.nix {
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
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
