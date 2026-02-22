{
  imports = [
    ../../config/aliases.nix
    ../../config/ipv6.nix

    ./boot.nix
    ./hardware-configuration.nix
    ./home.nix
    ./web/nginx.nix
    ./web/security.nix
  ];

  networking.hostName = "robcarruthers";
  networking.extraHosts = ''
    213.165.84.232 robcarruthers.co.uk robcarruthers.com
  '';

}
