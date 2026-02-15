{
  services.openssh = {
    enable = true;
    settings = {
      AcceptEnv = "COLORTERM";
    };
  };
}
