{
  nixpkgs.config = {
    permittedInsecurePackages = [
      "libsoup-2.74.3"
      "qtwebengine-5.15.19"
    ];
  };

  imports = [
    ../../config/aliases.nix
    ../../config/audio.nix
    ../../config/ipv6.nix
    ../../config/supercollider.nix
    ../../config/printing.nix
    ../../config/video.nix

    ./boot.nix
    ./hardware-configuration.nix
    ./home.nix
    ./monitor-switch.nix
    ./video.nix

    ../../apps/mullvad.nix
    ../../apps/podman.nix
  ];

  networking.hostName = "rob-pc";

  services.xserver.videoDrivers = [ "nvidia" ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    config.common.default = [ "wlr" ];
  };

  # for ch57x-keyboard-tool
  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ATTR{idVendor}=="1189", ATTR{idProduct}=="8840", GROUP="usb", MODE="0660"
    ACTION=="change", SUBSYSTEM=="power_supply", KERNEL=="apple_mfi_fastcharge*", ATTR{charge_type}="Fast"
  '';
}
