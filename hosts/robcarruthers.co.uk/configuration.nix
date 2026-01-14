{
  imports = [
    ./boot.nix
    ./environment.nix
    ./hardware-configuration.nix
    ./home.nix
    ./web/nginx.nix
    ./web/security.nix
  ];

  networking.hostName = "robcarruthers";
  networking.extraHosts = ''
    213.165.84.232 robcarruthers.co.uk robcarruthers.com
  '';

  services.openssh = {
    enable = true;
    ports = [ 10355 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
    };
  };
  services.fail2ban.enable = true;
  services.endlessh = {
    enable = true;
    port = 22;
    openFirewall = true;
  };
}
