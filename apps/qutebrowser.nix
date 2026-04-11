{ default-fonts, font-sizes, ... }:

let
  colors = {
    black0 = "#191D24";
    black1 = "#1E222A";
    black2 = "#222630";

    gray0 = "#242933";
    gray1 = "#2E3440";
    gray2 = "#3B4252";
    gray3 = "#434C5E";
    gray4 = "#4C566A";
    gray5 = "#60728A";

    white0_normal = "#BBC3D4";
    white0_reduce_blue = "#C0C8D8";

    white1 = "#D8DEE9";
    white2 = "#E5E9F0";
    white3 = "#ECEFF4";

    blue0 = "#5E81AC";
    blue1 = "#81A1C1";
    blue2 = "#88C0D0";

    cyan = {
      base = "#8FBCBB";
      bright = "#9FC6C5";
      dim = "#80B3B2";
    };

    red = {
      base = "#BF616A";
      bright = "#C5727A";
      dim = "#B74E58";
    };
    orange = {
      base = "#D08770";
      bright = "#D79784";
      dim = "#CB775D";
    };
    yellow = {
      base = "#EBCB8B";
      bright = "#EFD49F";
      dim = "#E7C173";
    };
    green = {
      base = "#A3BE8C";
      bright = "#B1C89D";
      dim = "#97B67C";
    };
    magenta = {
      base = "#B48EAD";
      bright = "#BE9DB8";
      dim = "#A97EA1";
    };
  };
in
{
  programs.qutebrowser = {
    enable = true;
    settings = {
      auto_save = {
        session = true;
      };
      changelog_after_upgrade = "patch";
      colors = {
        completion = {
          match.fg = colors.orange.bright;
        };
        hints = {
          bg = colors.yellow.dim;
          fg = colors.black2;
        };
        messages = {
          error = {
            bg = colors.red.base;
          };
        };
        statusbar = {
          normal = {
            bg = colors.black2;
            fg = colors.green.dim;
          };
          url = {
            fg = colors.green.base;
            success.http.fg = colors.green.base;
            success.https.fg = colors.green.base;
          };
        };
        tabs = {
          bar.bg = colors.black2;
          even.bg = colors.gray5;
          odd.bg = colors.gray3;
          selected = {
            even.bg = colors.black1;
            odd.bg = colors.black1;
          };
        };
      };
      fonts = {
        default_family = default-fonts.mono;
        default_size = toString (font-sizes.mono + 2) + "px";
      };
      search = {
        wrap = false;
      };
      tabs = {
        new_position.related = "next";
        new_position.unrelated = "next";
      };
      zoom.default = "90%";
    };
    extraConfig = ''
      config.bind("gw", "hint all")
      config.bind("<ctrl-o>", "back")
      config.bind("<ctrl-i>", "forward")
      config.bind("<ctrl-r>", "reload")
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
