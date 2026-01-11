{
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

  fileSystems."/mnt/data.disk" = {
    device = "/dev/disk/by-uuid/E4888080888052CA";
    fsType = "ntfs3";
    options = [
      "defaults"
      "noatime"
    ];
  };
}
