{
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.limine = {
    enable = true;
    extraEntries = ''
      /Arch Linux Install Media
          protocol: linux
          path: boot():/archlinux/vmlinuz-linux
          cmdline: img_dev=/dev/disk/by-uuid/AAD1-D263 img_loop=/archlinux/archlinux-2025.07.01-x86_64.iso archisobasedir=arch iomem=relaxed copytoram
          module_path: boot():/initramfs-linux.img

      /Windows 11
          protocol: efi
          path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
    '';
  };

  boot.kernelParams = [
    "audit=0"
    "mitigations=off"
    "ipv6.disable=1"
    "threadirqs"
  ];

  boot.blacklistedKernelModules = [
    "nouveau"
    "pcspkr"
  ];

}
