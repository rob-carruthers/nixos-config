{
  services.nginx = {
    enable = true;
    virtualHosts."robcarruthers.co.uk" = {
      enableACME = true;
      forceSSL = true;

      locations."/" = {
        root = "/var/www/tic-tac-toe";
        extraConfig = ''
          index  index.html index.htm;
        '';
      };

      locations."/tic-cat-toe" = {
        return = "301 /tic-cat-toe/";
      };

      locations."/tic-cat-toe/" = {
        alias = "/var/www/tic-tac-toe/";
        extraConfig = ''
          index  index.html;
          try_files $uri $uri/ /index.html;
        '';
      };

      locations."/calculator" = {
        return = "301 /calculator/";
      };

      locations."/calculator/" = {
        alias = "/var/www/calculator/";
        extraConfig = ''
          index  index.html;
          try_files $uri $uri/ /index.html;
        '';
      };

      locations."/restaurant" = {
        return = "301 /restaurant/";
      };

      locations."/restaurant/" = {
        alias = "/var/www/restaurant/dist/";
        extraConfig = ''
          index  index.html;
          try_files $uri $uri/ /index.html;
        '';
      };

      locations."/library" = {
        return = "301 /library/";
      };

      locations."/library/" = {
        alias = "/var/www/library/";
        extraConfig = ''
          index  index.html;
          try_files $uri $uri/ /index.html;
        '';
      };

      locations."/examcrunch" = {
        return = "301 /examcrunch/";
      };

      locations."/examcrunch/" = {
        alias = "/var/www/examcrunch-mockup/";
        extraConfig = ''
          index  index.html;
          try_files $uri $uri/ /index.html;
        '';
      };

    };
  };
}
