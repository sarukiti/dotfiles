{ config, pkgs, ... }:

let
  cmd-eikana = pkgs.callPackage ../packages/cmd-eikana.nix { };
in
{
  home.username = "sarukiti";
  home.homeDirectory = "/Users/sarukiti";

  home.stateVersion = "25.11";

  imports = [
    ./git/git.nix
    ./ghostty.nix
    ./zsh/zsh.nix
  ];

  home.packages = [
    pkgs.gh
    pkgs.fastfetch
    pkgs.code-cursor
    cmd-eikana
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.desktoppr = {
    enable = true;
    settings = {
      picture = "${config.home.homeDirectory}/dotfiles/img/帝国少女.png";
      scale = "fill";
    };
  };

  programs.home-manager.enable = true;
}
