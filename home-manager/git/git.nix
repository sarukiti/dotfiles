{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "sarukiti";
        email = "sarukiti1891@gmail.com";
      };
    };
    ignores = [ ".envrc" ".direnv/" ];
  };

  home.file = {
    ".gitconfig".source = ./.gitconfig;
  };
}
