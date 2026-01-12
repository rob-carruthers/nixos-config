{ pkgs, ... }:
{
  boot = {

    plymouth = {
      enable = true;
      theme = "bgrt";
    };

    # Enable "Silent boot"
    consoleLogLevel = 3;
    initrd.systemd.enable = true;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "udev.log_priority=3"
      "rd.systemd.show_status=auto"
    ];

  };
}
