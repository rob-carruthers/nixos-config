{ pkgs, ... }:

{
  home.packages = [
    (pkgs.supercollider-with-plugins.override {
      plugins = with pkgs.supercolliderPlugins; [
        sc3-plugins
      ];
    })
  ];
}
