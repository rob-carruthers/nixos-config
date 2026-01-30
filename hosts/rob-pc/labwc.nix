{
  wayland.windowManager.labwc = {
    autostart = [
      "kanshi &"
    ];
    environment = [
      "XKB_DEFAULT_LAYOUT=us"
    ];
    rc = {
      keyboard = {
        keybind = [
          {
            "@key" = "C-S-W-a";
            action = {
              "@name" = "Execute";
              "@command" = "mpc prev";
            };
          }
          {
            "@key" = "C-S-W-b";
            action = {
              "@name" = "Execute";
              "@command" = "mpc toggle";
            };
          }
          {
            "@key" = "C-S-W-c";
            action = {
              "@name" = "Execute";
              "@command" = "mpc next";
            };
          }
          {
            "@key" = "C-S-W-e";
            action = {
              "@name" = "Execute";
              "@command" = "ario";
            };
          }
          {
            "@key" = "C-S-W-o";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --change-volume +2";
            };
          }
          {
            "@key" = "C-S-W-m";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --change-volume -2";
            };
          }
          {
            "@key" = "C-S-W-n";
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
