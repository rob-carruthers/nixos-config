{ config, ... }:

{
  environment.shellAliases = {
    nrebuild = "sudo nixos-rebuild switch --flake .#${config.networking.hostName}";
  };
}
