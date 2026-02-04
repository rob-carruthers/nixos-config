{ pkgs, ... }:

let
  nordOpenboxTheme = pkgs.fetchFromGitLab {
    owner = "the-zero885";
    repo = "nord-openbox-theme";
    rev = "1818f7a1ba4f397cceb9023f7e14b35201e597f1";
    sha256 = "sha256-oaZ+YZOCIUzetCYs0BVXzmbGn96qKiJcRS/kCi2nyQY";
  };
in
{
  home.file.".themes/nord-openbox-theme".source = nordOpenboxTheme;
}
