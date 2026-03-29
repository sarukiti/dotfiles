{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;

    enableZshIntegration = true;

    settings = {
      theme = "Catppuccin Mocha";
      font-family = "UDEV Gothic 35NF";
      background-opacity = 0.88;
      background-blur = true;
      background-opacity-cells = false;
    };
  };
}
