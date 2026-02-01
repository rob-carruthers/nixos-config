{
  pkgs,
  unstablePkgs,
  ...
}:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    ./config/boot.nix
    ./config/inputrc.nix
    ./services
  ];

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";

  programs.dconf.enable = true;
  services.dbus.enable = true;
  security.polkit.enable = true;

  users.groups.usb = { };
  users.groups.lpadmin = { };
  users.users.rob = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "usb"
      "lpadmin"
    ];
  };

  programs.bash = {
    enable = true;
    interactiveShellInit = "eval $(starship init bash)";
    loginShellInit = "eval $(starship init bash)";
  };

  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
    helix
    inotify-tools
    lm_sensors
    ncdu
    nil
    nixfmt-rfc-style
    ripgrep
    squashfsTools
    wget
  ];
  environment.sessionVariables.QT_QPA_PLATFORM = "wayland";

  system.stateVersion = "25.11";

}
