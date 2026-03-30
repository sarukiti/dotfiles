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
    ./zsh/zsh.nix
    ./ghostty.nix
    ./direnv.nix  
  ];

  home.packages = [
    pkgs.ripgrep
    pkgs.gh
    pkgs.fastfetch
    pkgs.code-cursor
    pkgs.claude-code
    pkgs.discord
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
