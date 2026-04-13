{ ... }:

{
  mangoHostConfig = ''
    borderpx=5

    trackpad_natural_scrolling=1
    xkb_rules_layout=gb

    exec-once=legion-kb-rgb set -e Static -c 0,0,0,0,0,0,0,0,0,0,0,0
    exec-once=blueman-applet
  '';
}
