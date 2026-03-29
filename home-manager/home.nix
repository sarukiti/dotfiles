{ pkgs, ... }:

let
  cmd-eikana = pkgs.callPackage ../packages/cmd-eikana.nix { };
in
{
  home.username = "sarukiti";
  home.homeDirectory = "/Users/sarukiti";

  home.stateVersion = "25.11";

  imports = [
    ./git/git.nix
  ];

  home.packages = [
    pkgs.gh
    pkgs.code-cursor
    pkgs.ghostty-bin
    cmd-eikana
  ];

  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.home-manager.enable = true;

  programs.zsh.enable = true;
}
