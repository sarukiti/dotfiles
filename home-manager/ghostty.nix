{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty-bin;

    enableZshIntegration = true;

    settings = {
      background-opacity = 0.88;
      background-blur = true;
      background-opacity-cells = false;
    };
  };
}
