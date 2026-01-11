{ config, ... }:

{
  programs.sway.enable = false;
  hardware.graphics.enable = true;
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
  };

  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = "labwc";
      user = "rob";
    };
  };
}
