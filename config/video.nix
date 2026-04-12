{ pkgs, ... }:

{
  services.xserver.enable = false;
  programs.sway.enable = false;
  hardware.graphics.enable = true;

  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = "dbus-run-session dwl -s ${pkgs.writeShellScript "dwl-session" ''
        export WAYLAND_DISPLAY
        systemctl --user import-environment WAYLAND_DISPLAY DISPLAY XDG_CURRENT_DESKTOP
        systemctl --user start swayidle.service
      ''}";
      user = "rob";
    };
  };
}
