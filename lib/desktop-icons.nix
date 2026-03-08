{
  config,
  lib,
  pkgs,
  ...
}:

let
  cfg = config.desktopIcons;

  mkDesktopIcons =
    packages:
    lib.mkMerge (
      map (
        pkg:
        let
          appDir = "${pkg}/share/applications";
          entries = if builtins.pathExists appDir then builtins.readDir appDir else { };
        in
        lib.mapAttrs' (
          name: type:
          if lib.hasSuffix ".desktop" name then
            lib.nameValuePair "Desktop/${name}" { source = "${appDir}/${name}"; }
          else
            null
        ) entries
      ) packages
    );
in
{
  options.desktopIcons = {
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [ ];
      description = "Packages whose .desktop files should appear in ~/Desktop.";
    };
  };

  config = {
    home.packages = cfg.packages;
    home.file = mkDesktopIcons cfg.packages;
  };
}
