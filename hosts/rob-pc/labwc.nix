{
  wayland.windowManager.labwc = {
    environment = [
      "XKB_DEFAULT_LAYOUT=us"
    ];
    rc = {
      keyboard = {
        keybind = [
          {
            "@key" = "W-XF86_Tools";
            action = {
              "@name" = "Execute";
              "@command" = "mpc prev";
            };
          }
          {
            "@key" = "W-XF86_Launch5";
            action = {
              "@name" = "Execute";
              "@command" = "mpc toggle";
            };
          }
          {
            "@key" = "W-XF86_Launch6";
            action = {
              "@name" = "Execute";
              "@command" = "mpc next";
            };
          }
          {
            "@key" = "W-XF86_Launch8";
            action = {
              "@name" = "Execute";
              "@command" = "ario";
            };
          }
          {
            "@key" = "W-Print";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --change-volume +2";
            };
          }
          {
            "@key" = "W-Menu";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --change-volume -2";
            };
          }
          {
            "@key" = "W-Scroll_Lock";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --toggle-mute";
            };
          }
        ];
      };
    };

  };

}
