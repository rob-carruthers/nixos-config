{

  networking.firewall.allowedTCPPorts = [
    80
    443
  ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "robmcarruthers@gmail.com";
  };
  services.openssh = {
    enable = true;
    ports = [ 10355 ];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      PermitRootLogin = "no";
      LogLevel = "VERBOSE";
    };
  };
  services.fail2ban = {
    enable = true;
  };
  services.endlessh = {
    enable = true;
    port = 22;
    openFirewall = true;
  };
}
