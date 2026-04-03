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
  ];

  home.pointerCursor = {
    enable = true;
    name = "graphite-dark-nord";
    package = pkgs.graphite-cursors;
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      general = {
        layout = "master";
        gaps_in = 4;
        gaps_out = 8;
      };
      decoration = {
        rounding = 6;
      };
      animations = {
        # Default curves, see https://wiki.hypr.land/Configuring/Animations/#curves
        #        NAME,           X0,   Y0,   X1,   Y1
        bezier = [
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "quick,          0.15, 0,    0.1,  1"
        ];

        # Default animations, see https://wiki.hypr.land/Configuring/Animations/
        #           NAME,          ONOFF, SPEED, CURVE,        [STYLE]
        animation = [
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     1.94,  almostLinear, fade"
          "workspacesIn,  1,     1.21,  almostLinear, fade"
          "workspacesOut, 1,     1.94,  almostLinear, fade"
          "zoomFactor,    1,     7,     quick"
        ];
      };

      "$mod" = "SUPER";
      "$fileManager" = "pcmanfm-qt";
      "$terminal" = "ghostty -e tmux";
      "$menu" = "wofi -m -I --show drun";
      "$run" = "wofi -m -I --show run";
      "$lock" = "${pkgs.gtklock}/bin/gtklock";
      "$taskManager" = "qps";
      exec-once = [
        "waybar &"
        "pcmanfm-qt --desktop &"
        "env QT_QPA_PLATFORM=wayland XDG_CURRENT_DESKTOP=labwc syncthingtray --wait &"
      ];
      bind = [
        # Launchers
        "$mod, Return, exec, $terminal"
        "$mod, D, exec, $menu"
        "$mod, E, exec, $fileManager"
        "$mod, R, exec, $run"
        "CONTROL_L SHIFT, Escape, exec, $taskManager"
        "$mod, SHIFT L, exec, $lock"
        # Window management
        "$mod SHIFT, Return, layoutmsg, swapwithmaster"
        "$mod, F, fullscreen"
        "$mod, H, movefocus, l"
        "$mod, J, layoutmsg, cyclenext"
        "$mod, K, layoutmsg, cycleprev"
        "$mod, L, movefocus, r"
        "$mod SHIFT, k, layoutmsg, swapprev"
        "$mod SHIFT, j, layoutmsg, swapnext"
        "Alt_L, F4, killactive"
        "$mod SHIFT, Q, forcekillactive"
        # Workspaces
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        "$mod SHIFT, 1, movetoworkspacesilent, 1"
        "$mod SHIFT, 2, movetoworkspacesilent, 2"
        "$mod SHIFT, 3, movetoworkspacesilent, 3"
        "$mod SHIFT, 4, movetoworkspacesilent, 4"
        "$mod SHIFT, 5, movetoworkspacesilent, 5"
        "$mod SHIFT, 6, movetoworkspacesilent, 6"
        "$mod SHIFT, 7, movetoworkspacesilent, 7"
        "$mod SHIFT, 8, movetoworkspacesilent, 8"
        "$mod SHIFT, 9, movetoworkspacesilent, 9"
        "$mod SHIFT, 0, movetoworkspacesilent, 10"
        # Bye bye
        "$mod SHIFT, E, exit"

      ];
      master = {
        mfact = 0.55;
      };
      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        focus_on_activate = true;
      };
    };
  };
}
