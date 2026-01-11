{
  wayland.windowManager.labwc = {
    enable = true;
    autostart = [
      "kanshi &"
      "waybar &"
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
          #
          {
            "@key" = "W-Return";
            action = {
              "@name" = "Execute";
              "@command" = "foot";
            };
          }
          #
          {
            "@key" = "W-Esc";
            action = {
              "@name" = "Execute";
              "@command" = "loot";
            };
          }
        ];
      };
    };

    extraConfig = ''
      <keyboard>
        <default />
        <!-- The W- prefix refers to the Super key -->
        <keybind key="W-d">
          <action name="Execute" command="wofi --show drun" />
        </keybind>
        <keybind key="W-r">
          <action name="Execute" command="wofi --show run" />
        </keybind>
        <keybind key="W-Return">
          <action name="Execute" command="foot tmux" />
        </keybind>
        <keybind key="W-1">
          <action name="GoToDesktop" to="1" />
        </keybind>
        <keybind key="W-2">
          <action name="GoToDesktop" to="2" />
        </keybind>
        <keybind key="W-3">
          <action name="GoToDesktop" to="3" />
        </keybind>
        <keybind key="W-4">
          <action name="GoToDesktop" to="4" />
        </keybind>
        <keybind key="W-S-1">
          <action name="SendToDesktop" to="1" follow="no" />
        </keybind>
        <keybind key="W-S-2">
          <action name="SendToDesktop" to="2" follow="no" />
        </keybind>
        <keybind key="W-S-3">
          <action name="SendToDesktop" to="3" follow="no" />
        </keybind>
        <keybind key="W-S-4">
          <action name="SendToDesktop" to="4" follow="no" />
        </keybind>
        <keybind key="W-m">
          <action name="ToggleMaximize" />
        </keybind>

        <keybind key="W-XF86_Tools">
          <action name="Execute" command="mpc prev" />
        </keybind>
        <keybind key="W-XF86_Launch5">
          <action name="Execute" command="mpc toggle" />
        </keybind>
        <keybind key="W-XF86_Launch6">
          <action name="Execute" command="mpc next" />
        </keybind>
        <keybind key="W-XF86_Launch8">
          <action name="Execute" command="ario" />
        </keybind>
        <keybind key="W-Print">
          <action name="Execute" command="pulsemixer --change-volume +2" />
        </keybind>
        <keybind key="W-Menu">
          <action name="Execute" command="pulsemixer --change-volume -2" />
        </keybind>
        <keybind key="W-Scroll_Lock">
          <action name="Execute" command="pulsemixer --toggle-mute" />
        </keybind>
      </keyboard>
      <mouse>
        <default />
        <context name="Root">
          <mousebind button="Left" action="Press" />
        </context>
        <context name="Root">
          <mousebind button="Right" action="Press" />
        </context>
      </mouse>
      <desktops>
        <popupTime>1000</popupTime>
        <names>
          <name>1</name>
          <name>2</name>
          <name>3</name>
          <name>4</name>
        </names>
      </desktops>
    '';
  };
}
