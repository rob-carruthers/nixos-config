{ ... }:

{
  mangoHostConfig = ''
    borderpx=4

    xkb_rules_layout=us

    bind=CTRL+SHIFT+SUPER,a,spawn,mpc prev
    bind=CTRL+SHIFT+SUPER,b,spawn,mpc toggle
    bind=CTRL+SHIFT+SUPER,c,spawn,mpc next
    bind=CTRL+SHIFT+SUPER,e,spawn,ario
    bind=CTRL+SHIFT+SUPER,m,spawn,pulsemixer --change-volume -2
    bind=CTRL+SHIFT+SUPER,n,spawn,pulsemixer --toggle-mute
    bind=CTRL+SHIFT+SUPER,o,spawn,pulsemixer --change-volume +2

    exec-once=ch57x-keyboard-tool upload ~/.config/utility-keys/utility-keys.yaml
    monitorrule=serial:U5B3RM9A,width:1920,height:1080,refresh:143.99899
  '';
}
