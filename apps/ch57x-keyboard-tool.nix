{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ch57x-keyboard-tool
  ];
  xdg.configFile."utility-keys/utility-keys.yaml".source =
    ./files/ch57x-keyboard-tool/utility-keys.yaml;
}
