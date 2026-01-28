{
  pkgs,
  default-fonts,
  font-sizes,
  ...
}:

let
  foot-theme = pkgs.fetchurl {
    url = "https://codeberg.org/dnkl/foot/raw/tag/1.25.0/themes/alacritty";
    hash = "sha256-EytYDBLGn1QU2t5wYdH7hh7/SkmBl0B/9HhoKHKEeU4=";
  };
in
{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        include = "${foot-theme}";
        font = "${default-fonts.mono}:size=${toString font-sizes.mono}";
      };
      cursor = {
        style = "beam";
      };
    };
  };
}
