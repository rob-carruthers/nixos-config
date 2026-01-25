{ pkgs, ... }:

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

      set -g status-left-length 100
      set -g status-right-length 100
      set -g @nova-rows 0

      set -g @nova-pane-active-border-style "#44475a"
      set -g @nova-pane-border-style "#282a36"
      set -g @nova-status-style-bg "#4c566a"
      set -g @nova-status-style-fg "#d8dee9"
      set -g @nova-status-style-active-bg "#89c0d0"
      set -g @nova-status-style-active-fg "#2e3540"
      set -g @nova-status-style-double-bg "#2d3540"

      set -g @nova-pane "#I#{?pane_in_mode,  #{pane_mode},}  #W"


      set -g @nova-segment-clock "#(date +%H:%M)"
      set -g @nova-segment-clock-colors "#78a2c1 #2e3440"

    '';
  };
}
