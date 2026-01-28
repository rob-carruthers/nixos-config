{
  packages =
    pkgs: with pkgs; [
      font-awesome_5
      nerd-fonts.jetbrains-mono
      noto-fonts
    ];

  defaults = {
    regular = "Noto Sans Regular";
    mono = "JetBrainsMono Nerd Font Mono";
  };
}
