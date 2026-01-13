# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  pkgs,
  unstablePkgs,
  ...
}:

{
  nixpkgs.config = {
    allowUnfree = true;
  };

  imports = [
    # Include the results of the hardware scan.
    ./config/audio.nix
    ./config/boot.nix
    ./config/fonts.nix
    ./config/inputrc.nix
    ./config/video.nix
    ./services/avahi.nix
  ];

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  programs.dconf.enable = true;
  services.dbus.enable = true;
  security.polkit.enable = true;

  users.users.rob = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    #   packages = with pkgs; [
    #     tree
    #   ];
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  programs.nix-ld.enable = true;
  environment.systemPackages = with pkgs; [
    helix
    inotify-tools
    nil
    nixfmt-rfc-style
    ripgrep
    squashfsTools
    unstablePkgs.ruff
    unstablePkgs.ty
    uv
    wget
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.11"; # Did you read the comment?

}
