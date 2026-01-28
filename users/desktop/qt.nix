{ default-fonts, font-sizes, ... }:

let
  common-settings = {
    Appearance = {
      icon_theme = "Memphis98";
    };
    Fonts = {
      fixed = "\"${default-fonts.mono},${toString font-sizes.mono}\"";
      general = "\"${default-fonts.regular},${toString font-sizes.regular}\"";
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
