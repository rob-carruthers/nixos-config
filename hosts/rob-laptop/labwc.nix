{
  wayland.windowManager.labwc = {
    autostart = [
      "legion-kb-rgb set -e Static -c 0,0,0,0,0,0,0,0,0,0,0,0 &"
    ];
    environment = [
      "XKB_DEFAULT_LAYOUT=gb"
      "XCURSOR_THEME=graphite-dark-nord"
    ];
    rc = {
      keyboard = {
        keybind = [
          {
            "@key" = "XF86_AudioRaiseVolume";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --change-volume +5";
            };
          }
          {
            "@key" = "XF86_AudioLowerVolume";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --change-volume -5";
            };
          }
          {
            "@key" = "XF86_AudioMute";
            action = {
              "@name" = "Execute";
              "@command" = "pulsemixer --toggle-mute";
            };
          }
        ];
      };
      libinput = {
        device = {
          "@category" = "touchpad";
          naturalScroll = "yes";
        };
      };
    };

  };

}
