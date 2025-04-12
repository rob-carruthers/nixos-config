{ config, pkgs, ... }:

{
  imports = [
    ../modules/common.nix
  ];

  networking.hostName = "vm";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  fileSystems."/" = {
    device = "/dev/disk/by-label/NIXOS_ROOT";
    fsType = "ext4";
  };

  fileSystems."/boot/efi" = {
    device = "/dev/disk/by-label/EFI";
    fsType = "vfat";
  };

  # VirtualBox guest additions
  virtualisation.virtualbox.guest.enable = true;

  # User account
  users.users.rob = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    initialPassword = "nixos";  # change after install
    shell = pkgs.bash;
  };

  system.stateVersion = "24.05";
}
