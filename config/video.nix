{
  services.xserver.enable = false;
  programs.sway.enable = false;
  hardware.graphics.enable = true;

  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = "labwc";
      user = "rob";
    };
  };
}
