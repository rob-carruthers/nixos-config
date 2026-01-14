{
  services.nginx = {
    enable = true;
    virtualHosts."robcarruthers.co.uk" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        return = "200 '<html><body>It works</body></html>'";
        extraConfig = ''
          default_type text/html;
        '';
      };
    };
  };
}
