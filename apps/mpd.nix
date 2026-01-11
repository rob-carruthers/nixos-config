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
    '';

  };

  home.packages = with pkgs; [
    ario
    mpc
  ];

}
