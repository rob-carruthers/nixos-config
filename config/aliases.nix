{ config, ... }:

{
  environment.shellAliases = {
    nswitch = "sudo nixos-rebuild switch --flake .#${config.networking.hostName}";
  };
}
