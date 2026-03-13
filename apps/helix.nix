{ inputs, ... }:

{
  xdg.configFile."helix".source = inputs.helix-config;
}
