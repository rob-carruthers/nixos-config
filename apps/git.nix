{
  programs.git.enable = true;
  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        editPreset = "helix (hx)";
      };
      git = {
        merging = {
          args = "--no-ff";
        };
      };
      gui = {
        mouseEvents = false;
      };
    };
  };
}
