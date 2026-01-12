{ pkgs, ... }:

let
  monitorSwitch = pkgs.writeShellScriptBin "monitor_switch" ''
    #!/usr/bin/env bash

    if [ ! -f /home/rob/noswitch ] ; then
        if [[ "$1" == "add" ]]; then
            ${pkgs.ddcutil}/bin/ddcutil setvcp 60 x0f
            ${pkgs.xorg.xset}/bin/xset dpms force on
        elif [[ "$1" == "remove" ]]; then
            ${pkgs.ddcutil}/bin/ddcutil setvcp 60 x11
        fi
    fi
  '';
in
{
  environment.systemPackages = [
    monitorSwitch
  ];

  services.udev.extraRules = ''
    SUBSYSTEM=="usb", ACTION=="add", \
      ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="1a40/101/111", \
      RUN+="${monitorSwitch}/bin/monitor_switch add"

    SUBSYSTEM=="usb", ACTION=="remove", \
      ENV{DEVTYPE}=="usb_device", ENV{PRODUCT}=="1a40/101/111", \
      RUN+="${monitorSwitch}/bin/monitor_switch remove"
  '';
  services.udev.packages = [ pkgs.ddcutil ];

}
