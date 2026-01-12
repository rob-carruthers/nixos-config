{
  wayland.windowManager.labwc = {
    enable = true;
    autostart = [
      "kanshi &"
      "waybar &"
      "pcmanfm-qt --desktop &"
    ];
    rc = {
      theme = {
        name = "nord";
        cornerRadius = 8;
        font = {
          "@name" = "FiraCode";
          "@size" = "11";
        };
      };
      keyboard = {
        default = true;
        keybind = [
          {
            "@key" = "W-Return";
            action = {
              "@name" = "Execute";
              "@command" = "foot";
            };
          }
          {
            "@key" = "W-d";
            action = {
              "@name" = "Execute";
              "@command" = "wofi --show drun";
            };
          }
          {
            "@key" = "W-r";
            action = {
              "@name" = "Execute";
              "@command" = "wofi --show run";
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

    # extraConfig = ''
    #   <keyboard>
    #     <keybind key="W-XF86_Tools">
    #       <action name="Execute" command="mpc prev" />
    #     </keybind>
    #     <keybind key="W-XF86_Launch5">
    #       <action name="Execute" command="mpc toggle" />
    #     </keybind>
    #     <keybind key="W-XF86_Launch6">
    #       <action name="Execute" command="mpc next" />
    #     </keybind>
    #     <keybind key="W-XF86_Launch8">
    #       <action name="Execute" command="ario" />
    #     </keybind>
    #     <keybind key="W-Print">
    #       <action name="Execute" command="pulsemixer --change-volume +2" />
    #     </keybind>
    #     <keybind key="W-Menu">
    #       <action name="Execute" command="pulsemixer --change-volume -2" />
    #     </keybind>
    #     <keybind key="W-Scroll_Lock">
    #       <action name="Execute" command="pulsemixer --toggle-mute" />
    #     </keybind>
    #   </keyboard>
    # '';
  };
}
