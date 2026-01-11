{ pkgs, ... }:

let
  helixConfig = pkgs.fetchFromGitHub {
    owner = "rob-carruthers";
    repo = "helix";
    rev = "321ce71";
    sha256 = "sha256-+Uf1HDukgMzFv9CvN5DetLLYWUCHKoi+p+oyQl9NzyY=";
  };
in
{
  xdg.configFile."helix".source = helixConfig;
}
