{ lib, config, ... }:
let
  waybar_config = config.custom.waybar;
in
{
  options.custom.waybar.fontSizePx = lib.mkOption {
    type = lib.types.int;
    default = 14;
    description = "Waybar base font size";
  };

  config = {
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
          "backlight" = {
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
            "format-wifi" = "";
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
      style = ''
        * {
            border: none;
            border-radius: 0;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            font-size: ${toString waybar_config.fontSizePx}px;
            min-height: 0;
        }

        window#waybar {
            background: #c0c0c0;
            color: #000000;
            box-shadow: 0px 0px 3px 0px #00000;
            border-bottom: solid 1px #404040;

        }

        #workspaces {
            /* padding: 5px 10px; */
            margin: 5px 3px;
            background: #c0c0c0;
            color: #000000;
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;

        }

        #workspaces button {
            padding: 5px;
            margin: 0;
            background: #c0c0c0;
            color: #000000;
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;

        }

        #workspaces button:hover {
            box-shadow: 0px 0px 0px;
            text-shadow: none;
            background: #E0E0E0;
        }

        #workspaces button.active {
            background: #E0E0E0;
            color: #000000;
        }

        #taskbar button {
            padding: 5px 10px;
            margin: 5px 3px;
            background: #c0c0c0;
            color: #000000;
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            min-width: 200px;

        }

        #taskbar button.active {
            background: #E0E0E0;
            color: #000000;
            border-right: 1px solid #ffffff;
            border-bottom: 1px solid #ffffff;
            /* border-top: 1px solid #404040; */
            box-shadow: -1px -1px 1px 0px #000000;
        }

        #custom-start {
            padding: 5px 5px;
            margin: 5px 3px;
            font-weight: bold;
            background: url('/etc/profiles/per-user/rob/share/icons/Memphis98/places/48/start-here.png');
            background-position: left;
            background-repeat: no-repeat;
            background-size: contain;
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
        }

        /* #custom-start:hover { */
            /* background: url('/etc/profiles/per-user/rob/share/icons/Memphis98/places/48/start-here.png'); */
            /* background-position: left; */
            /* background-repeat: no-repeat; */
            /* background-size: contain; */
            /* box-shadow: 0px 0px 0px; */
            /* text-shadow: none; */
        /* } */

        #custom-start:active {
            background: url('/etc/profiles/per-user/rob/share/icons/Memphis98/places/48/start-here.png');
            background-position: left;
            background-repeat: no-repeat;
            background-size: contain;
            box-shadow: 0px 0px 0px;
            text-shadow: none;
            background-color: #f0f0f0;
        }

        #window {
            padding: 5px 10px;
            margin: 5px 3px;
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
        }

        #battery {
            padding: 5px 5px;
            margin: 5px 3px;
            background-color: #c0c0c0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            /* background-image: url('/etc/profiles/per-user/rob/share/icons/Memphis98/devices/48/battery.png'); */
            background-position: right;
            background-size: 30%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        #backlight {
            padding: 5px 5px;
            margin: 5px 3px;
            background-color: #c0c0c0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            /* background-image: url('/etc/profiles/per-user/rob/share/icons/Memphis98/status/48/sunny.png'); */
            background-position: right;
            background-size: 30%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        #wireplumber {
            padding: 5px 5px;
            margin: 5px 3px;
            background-color: #c0c0c0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            background-image: url('/etc/profiles/per-user/rob/share/icons/Memphis98/status/48/audio-volume-high.png');
            background-position: right;
            background-size: 30%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        #pulseaudio {
            padding: 5px 5px;
            margin: 5px 3px;
            min-width: 50px;
            background-color: #c0c0c0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            /* background-image: url('/etc/profiles/per-user/rob/share/icons/Memphis98/status/48/audio-volume-high.png'); */
            background-position: right;
            background-size: 30%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        #network, #tray {
            padding: 5px 5px;
            margin: 5px 3px;
            background-color: #c0c0c0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            /* background-image: url('/etc/profiles/per-user/rob/share/icons/Memphis98/devices/48/computer-laptop.png'); */
            background-position: right;
            background-size: 30%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        #cpu {
            padding: 5px 5px;
            margin: 5px 3px;
            background-color: #c0c0c0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            background-image: url('/etc/profiles/per-user/rob/share/icons/Memphis98/devices/48/processor.png');
            background-position: right;
            background-size: 30%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        #temperature {
            padding: 5px 5px;
            margin: 5px 3px;
            background-color: #c0c0c0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 1px solid #ffffff;
            border-top: 1px solid #ffffff;
            border-bottom: 1px solid #404040;
            box-shadow: 1px 1px 1px 0px #000000;
            background-image: url('/etc/profiles/per-user/rob/share/icons/Memphis98/status/48/weather-few-clouds.png');
            background-position: right;
            background-size: 30%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        #clock {
            padding: 5px 5px;
            margin: 5px 3px;
            background-color: #b0b0b0;
            color: #000000;
            font-family: "Noto Sans", "Font Awesome 5 Free";
            border-left: 0.5px solid #000000;
            border-top: 1px solid #000000;
            border-bottom: 1px solid #ffffff;
            border-right: 1px solid #ffffff;
            box-shadow: -1px -0.5px 0px 0px #000000;
            background-image: url("/etc/profiles/per-user/rob/share/icons/Memphis98/apps/48/clock.png");
            background-position: right;
            background-size: 13%;
            background-repeat: no-repeat;
            background-origin: content-box;
        }

        /*#battery button:hover,*/

        /*#pulseaudio:hover {
            background-color: #E0E0E0;
            box-shadow: 0px 0px 0px;
        }*/
      '';
    };
  };

}
