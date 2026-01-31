{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [
      cups-filters
      cups-browsed
    ];
  };

  hardware.printers = {
    ensureDefaultPrinter = "Brother_HL_L2400DWE";
    ensurePrinters = [
      {
        deviceUri = "dnssd://Brother%20HL-L2400DWE._ipp._tcp.local/?uuid=e3248000-80ce-11db-8000-44fa6613811b";
        location = "home";
        name = "Brother_HL_L2400DWE";
        model = "everywhere";
      }
    ];
  };
}
