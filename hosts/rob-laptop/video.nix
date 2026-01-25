{ config, ... }:

{
  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.production;
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      amdgpuBusId = "PCI:35@0:0:0";
      nvidiaBusId = "PCI:1@0:0:0";
    };
  };
}
