{ default-fonts, font-sizes, ... }:

{
  programs.qutebrowser = {
    enable = true;
    settings = {
      auto_save = {
        session = true;
      };
      fonts = {
        default_family = default-fonts.mono;
        default_size = toString (font-sizes.mono + 2) + "px";
      };
    };
  };
}
