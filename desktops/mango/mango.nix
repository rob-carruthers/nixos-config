{
  config,
  lib,
  pkgs,
  ...
}:
let
  mangoCommonConfig = ''
    # More option see https://github.com/DreamMaoMao/mango/wiki/

    # autostarts
    exec-once=waybar
    exec-once=sh -c env QT_QPA_PLATFORM=wayland XDG_CURRENT_DESKTOP=mango syncthingtray
    exec-once=pcmanfm-qt --desktop


    # Window effect
    blur=0
    blur_layer=0
    blur_optimized=1
    blur_params_num_passes = 2
    blur_params_radius = 5
    blur_params_noise = 0.02
    blur_params_brightness = 0.9
    blur_params_contrast = 0.9
    blur_params_saturation = 1.2

    shadows = 0
    layer_shadows = 0
    shadow_only_floating = 1
    shadows_size = 10
    shadows_blur = 15
    shadows_position_x = 0
    shadows_position_y = 0
    shadowscolor= 0x000000ff

    border_radius=6
    no_radius_when_single=0
    focused_opacity=1.0
    unfocused_opacity=0.7

    # Animation Configuration(support type:zoom,slide)
    # tag_animation_direction: 1-horizontal,0-vertical
    animations=1
    layer_animations=1
    animation_type_open=slide
    animation_type_close=slide
    animation_fade_in=1
    animation_fade_out=1
    tag_animation_direction=1
    zoom_initial_ratio=0.4
    zoom_end_ratio=0.8
    fadein_begin_opacity=0.5
    fadeout_begin_opacity=0.8
    animation_duration_move=400
    animation_duration_open=300
    animation_duration_tag=350
    animation_duration_close=600
    animation_duration_focus=100
    animation_curve_open=0.46,1.0,0.29,1
    animation_curve_move=0.46,1.0,0.29,1
    animation_curve_tag=0.46,1.0,0.29,1
    animation_curve_close=0.08,0.92,0,1
    animation_curve_focus=0.46,1.0,0.29,1
    animation_curve_opafadeout=0.5,0.5,0.5,0.5
    animation_curve_opafadein=0.46,1.0,0.29,1

    # Scroller Layout Setting
    scroller_structs=20
    scroller_default_proportion=0.8
    scroller_focus_center=0
    scroller_prefer_center=0
    edge_scroller_pointer_focus=1
    scroller_default_proportion_single=1.0
    scroller_proportion_preset=0.5,0.8,1.0

    # Master-Stack Layout Setting
    new_is_master=0
    default_mfact=0.55
    default_nmaster=1
    smartgaps=0

    # Overview Setting
    hotarea_size=10
    enable_hotarea=0
    ov_tab_mode=0
    overviewgappi=5
    overviewgappo=30

    # Misc
    no_border_when_single=0
    axis_bind_apply_timeout=100
    focus_on_activate=1
    idleinhibit_ignore_visible=0
    sloppyfocus=1
    warpcursor=1
    focus_cross_monitor=0
    focus_cross_tag=0
    enable_floating_snap=0
    snap_distance=30
    cursor_size=24
    drag_tile_to_tile=1

    # keyboard
    repeat_rate=25
    repeat_delay=400
    numlockon=1

    # Trackpad
    # need relogin to make it apply
    disable_trackpad=0
    tap_to_click=1
    tap_and_drag=1
    drag_lock=1
    disable_while_typing=1
    left_handed=0
    middle_button_emulation=0
    swipe_min_threshold=1

    # mouse
    # need relogin to make it apply
    mouse_natural_scrolling=0

    # Appearance
    gappih=5
    gappiv=5
    gappoh=10
    gappov=10
    scratchpad_width_ratio=0.8
    scratchpad_height_ratio=0.9
    rootcolor=0x201b14ff
    bordercolor=0x3b4252ff
    focuscolor=0x81a1c1ff
    maximizescreencolor=0x89aa61ff
    urgentcolor=0xb74e58ff
    scratchpadcolor=0x516c93ff
    globalcolor=0xb153a7ff
    overlaycolor=0x14a57cff

    # layout support:
    # tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
    tagrule=id:1,layout_name:tile
    tagrule=id:2,layout_name:tile
    tagrule=id:3,layout_name:tile
    tagrule=id:4,layout_name:tile
    tagrule=id:5,layout_name:tile
    tagrule=id:6,layout_name:tile
    tagrule=id:7,layout_name:tile
    tagrule=id:8,layout_name:tile
    tagrule=id:9,layout_name:tile

    # Key Bindings
    # key name refer to `xev` or `wev` command output,
    # mod keys name: super,ctrl,alt,shift,none

    # reload config
    bind=SUPER+SHIFT,r,reload_config

    # launchers
    bind=SUPER,d,spawn,wofi -m -I --show drun
    bind=SUPER,r,spawn,wofi -m -I --show run
    bind=SUPER,Return,spawn,foot tmux
    bind=SUPER,e,spawn,pcmanfm-qt
    bind=CTRL+SHIFT,escape,spawn,qps

    # exit
    bind=SUPER,m,quit
    bind=ALT,q,killclient,

    # switch window focus
    bind=SUPER,h,focusdir,left
    bind=SUPER,j,focusstack,next
    bind=SUPER,k,focusstack,prev
    bind=SUPER,l,focusdir,right

    # swap window
    bind=SUPER+SHIFT,h,exchange_client,left
    bind=SUPER+SHIFT,k,exchange_client,up
    bind=SUPER+SHIFT,j,exchange_client,down
    bind=SUPER+SHIFT,l,exchange_client,right
    bind=SUPER+SHIFT,Return,zoom

    # switch window status
    bind=SUPER,g,toggleglobal,
    bind=SUPER,Tab,toggleoverview,
    bind=ALT,backslash,togglefloating,
    bind=SUPER,m,togglemaximizescreen,
    bind=SUPER,f,togglefullscreen,
    bind=ALT+SHIFT,f,togglefakefullscreen,
    # bind=SUPER,i,minimized,
    bind=SUPER,o,toggleoverlay,
    bind=SUPER+SHIFT,I,restore_minimized
    bind=ALT,z,toggle_scratchpad

    # scroller layout
    bind=ALT,e,set_proportion,1.0

    # switch layout
    # bind=SUPER,n,switch_layout

    # tag switch - not used
    # bind=SUPER,Left,viewtoleft,0
    # bind=CTRL,Left,viewtoleft_have_client,0
    # bind=SUPER,Right,viewtoright,0
    # bind=CTRL,Right,viewtoright_have_client,0
    # bind=CTRL+SUPER,Left,tagtoleft,0
    # bind=CTRL+SUPER,Right,tagtoright,0

    bind=SUPER,1,view,1,0
    bind=SUPER,2,view,2,0
    bind=SUPER,3,view,3,0
    bind=SUPER,4,view,4,0
    bind=SUPER,5,view,5,0
    bind=SUPER,6,view,6,0
    bind=SUPER,7,view,7,0
    bind=SUPER,8,view,8,0
    bind=SUPER,9,view,9,0

    # tag: move client to the tag and focus it
    # tagsilent: move client to the tag and not focus it
    # bind=Alt,1,tagsilent,1
    bind=SUPER+SHIFT,1,tagsilent,1
    bind=SUPER+SHIFT,2,tagsilent,2
    bind=SUPER+SHIFT,3,tagsilent,3
    bind=SUPER+SHIFT,4,tagsilent,4
    bind=SUPER+SHIFT,5,tagsilent,5
    bind=SUPER+SHIFT,6,tagsilent,6
    bind=SUPER+SHIFT,7,tagsilent,7
    bind=SUPER+SHIFT,8,tagsilent,8
    bind=SUPER+SHIFT,9,tagsilent,9

    # monitor switch
    bind=alt+shift,Left,focusmon,left
    bind=alt+shift,Right,focusmon,right
    bind=SUPER+Alt,Left,tagmon,left
    bind=SUPER+Alt,Right,tagmon,right

    # gaps
    bind=ALT+SHIFT,X,incgaps,1
    bind=ALT+SHIFT,Z,incgaps,-1
    bind=ALT+SHIFT,R,togglegaps

    # movewin
    bind=CTRL+SHIFT,Up,movewin,+0,-50
    bind=CTRL+SHIFT,Down,movewin,+0,+50
    bind=CTRL+SHIFT,Left,movewin,-50,+0
    bind=CTRL+SHIFT,Right,movewin,+50,+0

    # resizewin
    bind=CTRL+ALT,k,resizewin,+0,-50
    bind=CTRL+ALT,j,resizewin,+0,+50
    bind=CTRL+ALT,h,resizewin,-50,+0
    bind=CTRL+ALT,l,resizewin,+50,+0

    # Mouse Button Bindings
    # btn_left and btn_right can't bind none mod key
    mousebind=SUPER,btn_left,moveresize,curmove
    mousebind=NONE,btn_middle,togglemaximizescreen,0
    mousebind=SUPER,btn_right,moveresize,curresize


    # Axis Bindings
    axisbind=SUPER,UP,viewtoleft_have_client
    axisbind=SUPER,DOWN,viewtoright_have_client


    # layer rule
    layerrule=animation_type_open:zoom,layer_name:wofi
    layerrule=animation_type_close:zoom,layer_name:wofi
  '';
in
{
  options.mangoHostConfig = lib.mkOption {
    type = lib.types.lines;
    default = "";
  };

  imports = [
    ../../apps/firefox.nix
    ../../apps/foot.nix
    ../../apps/pcmanfm-qt.nix
    ../../apps/qutebrowser.nix
    ../../apps/waybar.nix
    ../../apps/wofi.nix
  ];

  config = {
    home.file.".config/mango/config.conf".text = mangoCommonConfig + config.mangoHostConfig;

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
  };
}
