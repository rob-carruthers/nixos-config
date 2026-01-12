{
  boot.loader.limine.extraEntries = ''
    /Gentoo Linux
      //6.12.58
        protocol: linux
        path: boot():/kernel-6.12.58-gentoo
        cmdline: root=/dev/mapper/root rootfstype=ext4 rd.luks.name=c5a29596-1e6d-48b7-bfbc-31edef562cec=root acpi_osi=Linux ipv6.disable=1 udev.log_level=3 loglevel=3 systemd.show_status=false rd.udev.log_level=3 pcie_aspm=force module_blacklist=nouveau quiet nowatchdog nmi_watchdog=0 rw module_blacklist=pcspkr acpi.error_level=0x1 acpi.error_log_level=0
        module_path: boot():/initramfs-6.12.58-gentoo.img

    /Arch Linux Install Media
        protocol: linux
        path: boot():/archlinux/vmlinuz-linux
        cmdline: img_dev=/dev/disk/by-uuid/AAD1-D263 img_loop=/archlinux/archlinux-2025.07.01-x86_64.iso archisobasedir=arch iomem=relaxed copytoram
        module_path: boot():/initramfs-linux.img

    /Windows 11
        protocol: efi
        path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
  '';

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
