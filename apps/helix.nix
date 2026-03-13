{ ... }:

let
  helixConfig = builtins.fetchGit {
    url = "https://github.com/rob-carruthers/helix";
    rev = "f6c858aeca10feb24c2fbac6450cf1ee0cde12a0";
  };
in
{
  xdg.configFile."helix".source = helixConfig;
}
