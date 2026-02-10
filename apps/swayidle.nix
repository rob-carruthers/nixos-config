{
  lib,
  pkgs,
  ...
}:

{
  services.swayidle =
    let
      lock = "${pkgs.gtklock}/bin/gtklock";
      off = "${pkgs.wlopm}/bin/wlopm --off \\*";
      on = "${pkgs.wlopm}/bin/wlopm --on \\*";
    in
    {
      enable = true;
      timeouts = [
        {
          timeout = 300;
          command = lib.escapeShellArgs [
            "${pkgs.bash}/bin/bash"
            "-c"
            "${lock} & sleep 0.5; ${off}"
          ];
          resumeCommand = on;
        }
      ];
    };

}
