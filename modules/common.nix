{ config, pkgs, ... }:

{
  time.timeZone = "Europe/London";
  i18n.defaultLocale = "en_GB.UTF-8";

  environment.systemPackages = with pkgs; [
    git
    htop
  ];
