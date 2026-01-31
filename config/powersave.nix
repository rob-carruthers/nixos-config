{
  boot.kernelParams = [ "pcie_aspm=policy=powersupersave" ];
  boot.extraModprobeConfig = ''
    options snd_hda_intel power_save=1
  '';
  boot.kernel.sysctl = {
    "vm.swappiness" = 10;
    "vm.dirty_writeback_centisecs" = 1500;
    "vm.dirty_expire_centisecs" = 1500;
  };
}
