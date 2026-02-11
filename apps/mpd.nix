{ pkgs, ... }:

{
  services.mpd = {
    enable = true;
    musicDirectory = "/mnt/data.disk/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
      restore_paused "yes"
    '';

  };

  services.mpd-mpris.enable = true;

  home.packages = with pkgs; [
    ario
    mpc
    playerctl
  ];

}
