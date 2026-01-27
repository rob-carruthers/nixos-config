{ font-sizes, ... }:

let
  common-settings = {
    Appearance = {
      icon_theme = "Memphis98";
    };
    Fonts = {
      fixed = "\"JetBrainsMono Nerd Font Mono,${toString font-sizes.mono}\"";
      general = "\"Noto Sans Regular,${toString font-sizes.regular}\"";
    };
  };
in

{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    qt5ctSettings = common-settings;
    qt6ctSettings = common-settings;
  };
}
