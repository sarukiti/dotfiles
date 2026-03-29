{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;

    enableZshIntegration = true;

    settings = {
      font-family = "UDEV Gothic NF";
      font-size = 14;
      background-opacity = 0.88;
      background-blur = true;
      background-opacity-cells = false;
    };
  };
}
