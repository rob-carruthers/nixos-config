{
  lib,
  pkgs,
  osConfig,
  ...
}:

{
  services.swayidle =
    let
      lock = "${pkgs.gtklock}/bin/gtklock";
      display = status: "${pkgs.wlopm}/bin/wlopm --${status} \\*";
    in
    {
      enable = true;
      timeouts = lib.mkMerge [
        (lib.mkIf (osConfig.networking.hostName == "rob-laptop") [
          {
            timeout = 300;
            command = lock;
          }
        ])
        [
          {
            timeout = 60;
            command = display "off";
            resumeCommand = display "on";
          }
        ]
      ];
    };

}
