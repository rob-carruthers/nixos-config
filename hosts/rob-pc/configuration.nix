# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  config,
  lib,
  pkgs,
  ...
}:

{

  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "libsoup-2.74.3"
    ];
  };

  boot.loader.limine.extraEntries = ''

    /Void Linux
        //6.18.3
        protocol: linux
        path: boot():/vmlinuz-6.18.3_1
        cmdline: root=PARTUUID=6fa8381d-5d8b-1f48-8b62-3e38a99153e3 rootfstype=btrfs rootflags=subvol=/@void,compress=zstd rw audit=0 mitigations=off usbcore.autosuspend=-1 modprobe.blacklist=nouveau,pcspkr,snd_hda_codec_hdmi,snd_hda_intel ipv6.disable=1 memmap=0x10000$0x0002ec1437d0 memmap=0x100000$0x002ee143950 threadirqs quiet nvidia.NVreg_EnableGpuFirmware=0 nvidia_drm.modeset=1
        module_path: boot():/initramfs-6.18.3_1.img


    /Windows 11
        protocol: efi
        path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
  '';

  networking.hostName = "rob-pc"; # Define your hostname.

  # Configure network connections interactively with nmcli or nmtui.
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  services.xserver.videoDrivers = [ "nvidia" ];

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.rob = {
    imports = [
      ../../users/rob.nix

      ../../apps/foot.nix
      ../../apps/helix.nix
      ../../apps/kanshi.nix
      ../../apps/labwc.nix
      ../../apps/mpd.nix
      ../../apps/starship.nix
      ../../apps/tmux.nix
      ../../apps/waybar.nix
      ../../apps/wofi.nix
    ];
    qt.qt5ctSettings = {
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,8\"";
      };
    };
    qt.qt6ctSettings = {
      Fonts = {
        fixed = "\"JetBrainsMono Nerd Font Mono,9\"";
        general = "\"Noto Sans Regular,8\"";
      };
    };
  };
  home-manager.users.root = {
    imports = [
      ../../users/root.nix
    ];
  };

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.

  # programs.firefox.enable = true;

  # List packages installed in system profile.
  # You can use https://search.nixos.org/ to find more packages (and options).
  # environment.systemPackages = with pkgs; [
  #   helix
  #   htop
  #   inotify-tools
  #   nixfmt-rfc-style
  #   ripgrep
  #   wget
  # ];

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
