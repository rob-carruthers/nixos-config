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
    monitorrule=model:G24-10,refresh:144
  '';
}
