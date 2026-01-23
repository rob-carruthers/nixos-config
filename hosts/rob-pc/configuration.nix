{
  imports = [
    ../../config/audio.nix
    ../../config/fonts.nix
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

  nixpkgs.config = {
    permittedInsecurePackages = [
      "libsoup-2.74.3"
    ];
  };

  networking.hostName = "rob-pc";

  services.xserver.videoDrivers = [ "nvidia" ];

  services.openssh.enable = true;
  services.resolved.enable = true;
}
