{ pkgs, ... }:

{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "qtwebengine-5.15.19"
    ];
  };

  imports = [
    ../../config/auto-cpufreq.nix
    ../../config/audio.nix
    ../../config/fonts.nix
    ../../config/supercollider.nix
    ../../config/video.nix

    ./battery-conservative.nix
    ./boot.nix
    ./environment.nix
    ./hardware-configuration.nix
    ./home.nix
    ./video.nix

    ../../apps/mullvad.nix
  ];

  networking.hostName = "rob-laptop";

  console = {
    keyMap = "uk";
  };

  services.xserver.videoDrivers = [
    "nvidia"
    "amdgpu"
  ];

  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    acpi
  ];

  services.openssh.enable = true;
  services.resolved.enable = true;
}
