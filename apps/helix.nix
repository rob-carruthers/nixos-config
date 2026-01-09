{ pkgs, ... }:

let
  helixConfig = pkgs.fetchFromGitHub {
    owner = "rob-carruthers";
    repo = "helix";
    rev = "c7d5a03";
    sha256 = "sha256-CDZerHBxzw82k9lyEQrEe9yLKdMygSDuLwrIvGv3A5k=";
  };
in
{
  xdg.configFile."helix".source = helixConfig;
}


