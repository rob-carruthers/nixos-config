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
    ../../config/supercollider.nix
    ../../config/printing.nix
    ../../config/video.nix

    ../../apps/gtklock.nix

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

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = [ "wlr" ];
  };

  services.libinput.enable = true;

  environment.systemPackages = with pkgs; [
    acpi
  ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="048d", ATTR{idProduct}=="c975", MODE="0666"
  '';
}
