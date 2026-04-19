{ ... }:

{
  mangoHostConfig = ''
    borderpx=5

    trackpad_natural_scrolling=1
    xkb_rules_layout=gb

    bind=NONE,XF86AudioRaiseVolume,spawn,pulsemixer --change-volume +5
    bind=NONE,XF86AudioLowerVolume,spawn,pulsemixer --change-volume -5
    bind=NONE,XF86AudioMute,spawn,pulsemixer --toggle-mute
    bind=NONE,XF86MonBrightnessUp,spawn,brightnessctl s +5%
    bind=NONE,XF86MonBrightnessDown,spawn,brightnessctl s 5%-

    exec-once=legion-kb-rgb set -e Static -c 0,0,0,0,0,0,0,0,0,0,0,0
    exec-once=blueman-applet
  '';
}
