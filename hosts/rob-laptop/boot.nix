{
  boot.loader.limine = {
    enable = true;
    maxGenerations = 5;
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

}
