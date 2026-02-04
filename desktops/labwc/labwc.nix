{
  pkgs,
  default-fonts,
  font-sizes,
  ...
}:

{
  imports = [
    ../../apps/firefox.nix
    (import ../../apps/foot.nix {
      pkgs = pkgs;
      default-fonts = default-fonts;
      font-sizes = font-sizes;
    })
    ../../apps/pcmanfm-qt.nix
    ../../apps/waybar.nix
    ../../apps/wofi.nix

    ./themes/nord.nix
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
  ];

  home.pointerCursor = {
    enable = true;
    name = "graphite-dark-nord";
    package = pkgs.graphite-cursors;
  };

  wayland.windowManager.labwc = {
    enable = true;
    autostart = [
      "waybar &"
      "pcmanfm-qt --desktop &"
      "env QT_QPA_PLATFORM=wayland XDG_CURRENT_DESKTOP=labwc syncthingtray --wait &"
    ];
    environment = [
      "XCURSOR_THEME=graphite-dark-nord"
    ];
    rc = {
      theme = {
        name = "nord-openbox-theme";
        cornerRadius = 8;
        font = {
          "@name" = default-fonts.regular;
          "@size" = toString font-sizes.regular;
        };
      };
      keyboard = {
        default = true;
        keybind = [
          {
            "@key" = "W-Return";
            action = {
              "@name" = "Execute";
              "@command" = "foot tmux";
            };
          }
          {
            "@key" = "W-d";
            action = {
              "@name" = "Execute";
              "@command" = "wofi -m -I --show drun";
            };
          }
          {
            "@key" = "W-e";
            action = {
              "@name" = "Execute";
              "@command" = "pcmanfm-qt";
            };
          }
          {
            "@key" = "W-r";
            action = {
              "@name" = "Execute";
              "@command" = "wofi -m -I --show run";
            };
          }
          {
            "@key" = "W-1";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "1";
            };
          }
          {
            "@key" = "W-2";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "2";
            };
          }
          {
            "@key" = "W-3";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "3";
            };
          }
          {
            "@key" = "W-4";
            action = {
              "@name" = "GoToDesktop";
              "@to" = "4";
            };
          }
          {
            "@key" = "W-S-1";
            action = {
              "@name" = "SendToDesktop";
              "@to" = "1";
              "@follow" = "no";
            };
          }
          {
            "@key" = "W-S-2";
            action = {
              "@name" = "SendToDesktop";
              "@to" = "2";
              "@follow" = "no";
            };
          }
          {
            "@key" = "W-S-3";
            action = {
              "@name" = "SendToDesktop";
              "@to" = "3";
              "@follow" = "no";
            };
          }
          {
            "@key" = "W-S-4";
            action = {
              "@name" = "SendToDesktop";
              "@to" = "4";
              "@follow" = "no";
            };
          }
          {
            "@key" = "W-m";
            action = {
              "@name" = "ToggleMaximize";
            };
          }
        ];
      };
      mouse = {
        default = true;
        context = [
          {
            "@name" = "Root";
            mousebind = {
              button = "Left";
              action = "Press";
            };
          }
          {
            "@name" = "Root";
            mousebind = {
              button = "Right";
              action = "Press";
            };
          }
        ];
      };
      desktops = {
        popupTime = 1000;
        names = {
          name = [
            "1"
            "2"
            "3"
            "4"
          ];
        };
      };
    };
  };
}
