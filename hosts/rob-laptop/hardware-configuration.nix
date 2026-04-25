{
  config,
  lib,
  modulesPath,
  ...
}:

{
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ../../config/powersave.nix
  ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "thunderbolt"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [
    "kvm-amd"
    "snd_hda_intel"
  ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    device = "/dev/mapper/crypt";
    fsType = "btrfs";
    options = [
      "subvol=@nixos"
      "compress=zstd"
      "noatime"
    ];
  };

  boot.initrd.luks.devices."crypt".device = "/dev/disk/by-uuid/c5a29596-1e6d-48b7-bfbc-31edef562cec";

  fileSystems."/boot" = {
    device = "/dev/disk/by-uuid/AAD1-D263";
    fsType = "vfat";
    options = [
      "fmask=0077"
      "dmask=0077"
    ];
  };

  swapDevices = [
    {
      device = "/dev/disk/by-partuuid/ff8a004a-3cc0-4900-b8f0-56e7c109654d";
      options = [ "discard" ];
      randomEncryption = {
        enable = true;
        allowDiscards = true;
      };
    }
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        Experimental = true;
      };
      Policy = {
        AutoEnable = true;
      };
    };
  };
}
