{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        "layer" = "top";
        "position" = "bottom";
        "height" = 30;
        "spacing" = 0;

        "modules-left" = [
          "custom/start"
          "ext/workspaces"
          "wlr/taskbar"
        ];
        "modules-center" = [ ];
        "modules-right" = [
          "temperature"
          "pulseaudio"
          "backlight"
          "network"
          "battery"
          "tray"
          "clock"
        ];
        "custom/start" = {
          "format" = "        Start";
          "tooltip" = false;
          "on-click" = "exec nwg-menu -cmd-logout 'labwc -e' -k -term 'foot' -fm 'pcmanfm-qt'";
        };
        "ext/workspaces" = {
          "format" = " ";
          "on-click" = "activate";
        };
        "wlr/taskbar" = {
          "all-outputs" = false;
          "format" = "{icon} {name}";
          "on-click" = "activate";
        };
        "tray" = {
          "spacing" = 4;
        };
        "clock" = {
          "timezone" = "Europe/London";
          "interval" = 60;
          "format" = "{:%d/%m/%Y %H:%M}";
        };
        "cpu" = {
          "format" = "{usage}% ";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}% ";
          "tooltip" = false;
        };
        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{temperatureC}°C {icon}";
          "format-icons" = [
            ""
            ""
            ""
          ];
        };
        "racklight" = {
          "format" = "{percent}% {icon} ";
          "format-icons" = [
            "󰌶"
            "󱩎"
            "󱩏"
            "󱩐"
            "󱩑"
            "󱩒"
            "󱩓"
            "󱩔"
            "󱩕"
            "󱩖"
            "󰛨"
          ];
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon} ";
          "format-charging" = "{capacity}% 󰂄";
          "format-plugged" = "{capacity}% 󰂄";
          "format-alt" = "{time} {icon} ";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
          "tooltip-format" = "{time} remaining";
        };
        "pulseaudio" = {
          "format" = "{volume}% {icon} ";
          "format-muted" = "0% 󰝟 ";
          "format-source-muted" = "󰝟";
          "format-icons" = {
            "headphone" = "󰋋";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = "";
          };
          "on-click" = "pavucontrol";
        };
        "network" = {
          "format" = "{ifname}";
          "format-wifi" = " ";
          "format-ethernet" = "󰊗 ";
          "format-disconnected" = " ";
          "tooltip-format" = "{ifname} via {gwaddr} 󰊗";
          "tooltip-format-wifi" = "{essid} ({signalStrength}%) ";
          "tooltip-format-ethernet" = "{ifname} ";
          "tooltip-format-disconnected" = "Disconnected";
          "max-length" = 50;
        };
      };
    };
  };

}
