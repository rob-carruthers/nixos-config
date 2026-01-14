{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      command_timeout = 1000;
      scan_timeout = 100;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
