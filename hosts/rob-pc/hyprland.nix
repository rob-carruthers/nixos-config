{
  wayland.windowManager.hyprland.settings = {
    monitor = ",1920x1080@144,auto,1";
    input = {
      kb_layout = "us";
    };
    exec-once = [
      "ch57x-keyboard-tool upload ~/.config/utility-keys/utility-keys.yaml &"
    ];
    bind = [
      # Utility key launchers
      "$mod CONTROL_L SHIFT, E, exec, ario"
    ];
    bindel = [
      "$mod CONTROL_L SHIFT, A, exec, mpc prev"
      "$mod CONTROL_L SHIFT, B, exec, mpc toggle"
      "$mod CONTROL_L SHIFT, C, exec, mpc next"
      "$mod CONTROL_L SHIFT, M, exec, pulsemixer --change-volume -2"
      "$mod CONTROL_L SHIFT, N, exec, pulsemixer --toggle-mute"
      "$mod CONTROL_L SHIFT, O, exec, pulsemixer --change-volume +2"
    ];
  };
}
