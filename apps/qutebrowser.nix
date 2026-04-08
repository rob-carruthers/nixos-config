{ default-fonts, font-sizes, ... }:

let
  colors = {
    black2 = "#222630";
    blue2 = "#88C0D0";
    green_d = "#97B67C";
  };
in
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
      colors = {
        tabs = {
          bar.bg = colors.black2;
        };
        statusbar = {
          normal.bg = colors.black2;
          normal.fg = colors.green_d;
          url.fg = colors.blue2;
        };
      };
    };
    extraConfig = ''
      config.bind("gw", "hint all")
      config.bind("<ctrl-o>", "back")
      config.bind("<ctrl-i>", "forward")
      config.bind("<alt-w>", "tab-close")
      config.bind("<alt-PgUp>", "tab-prev")
      config.bind("<alt-PgDown>", "tab-next")
      c.hints.selectors["all"] = [
        "a",
        "area",
        "textarea",
        "select",
        "input:not([type=hidden])",
        "button",
        "label",
        "[onclick]",
        "[onmousedown]",
        "[role=link]",
        "[role=button]",
        "*[tabindex]",
      ]
    '';
  };
}
