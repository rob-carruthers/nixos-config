{ config, ... }:

{
  environment.shellAliases = {
    nswitch = "sudo nixos-rebuild switch --flake .#${config.networking.hostName}";
    nbuild = "nix build .#nixosConfigurations.${config.networking.hostName}.config.system.build.toplevel";
    ndiff = "nbuild; nvd diff /run/current-system ./result";
  };
}
