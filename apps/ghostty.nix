{ default-fonts, font-sizes, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      theme = "nordic";
      font-family = default-fonts.mono;
      font-size = font-sizes.mono;
      cursor-style = "bar";
      cursor-style-blink = false;
    };
    themes = {
      nordic = {
        background = "#242933";
        foreground = "#bbc3d4";
        selection-background = "#1b1f26";
        selection-foreground = "#bbc3d4";
        cursor-color = "#bbc3d4";
        cursor-text = "#191d24";
        palette = [
          "0=#191d24"
          "1=#bf616a"
          "2=#a3be8c"
          "3=#ebcb8b"
          "4=#5e81ac"
          "5=#b48ead"
          "6=#8fbcbb"
          "7=#bbc3d4"
          "8=#3b4252"
          "9=#c5727a"
          "10=#b1c89d"
          "11=#efd49f"
          "12=#88c0d0"
          "13=#be9d88"
          "14=#9fc6c5"
          "15=#d8dee9"
        ];
      };
    };
  };
}
