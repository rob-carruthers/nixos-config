{ pkgs, ... }:
let
  cputempScript = pkgs.writeShellScript "cputemp.sh" ''
    #!${pkgs.stdenv.shell}

    sensors k10temp-* 2>/dev/null | awk '
      /Tccd1/ {
        gsub(/[^0-9.]/, "", $2)
        printf "%d°C", int($2+0.5)
        exit
      }'
  '';
in
{
  programs.tmux = {
    enable = true;
    clock24 = true;
    mouse = true;
    plugins = with pkgs; [
      tmuxPlugins.tmux-nova
      tmuxPlugins.sensible
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.yank
    ];
    prefix = "C-Space";
    terminal = "foot";
    extraConfig = ''
      set -g @nova-nerdfonts true
      set -g @nova-nerdfonts-left 
      set -g @nova-nerdfonts-right 

      set -g status-interval 10
      set -g status-left-length 100
      set -g status-right-length 100
      set -g @nova-rows 0

      set -g @nova-pane-active-border-style "#44475a"
      set -g @nova-pane-border-style "#282a36"
      set -g @nova-status-style-bg "#4c566a"
      set -g @nova-status-style-fg "#d8dee9"
      set -g @nova-status-style-active-bg "#88c0d0"
      set -g @nova-status-style-active-fg "#2e3440"
      set -g @nova-status-style-double-bg "#2e3440"

      set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"

      set -g @nova-segment-clock "#(date +%H:%M)"
      set -g @nova-segment-clock-colors "#88c0d0 #2e3440"

      set -g @nova-segment-cputemp "#(${cputempScript})"
      set -g @nova-segment-cputemp-colors "#be9db8 #2e3440"
    '';
  };
}
