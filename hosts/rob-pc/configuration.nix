{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "libsoup-2.74.3"
      "qtwebengine-5.15.19"
    ];
  };

  imports = [
    ../../config/audio.nix
    ../../config/supercollider.nix
    ../../config/video.nix

    ./boot.nix
    ./environment.nix
    ./hardware-configuration.nix
    ./home.nix
    ./monitor-switch.nix
    ./video.nix

    ../../apps/mullvad.nix
  ];

  networking.hostName = "rob-pc";

  services.xserver.videoDrivers = [ "nvidia" ];
}
