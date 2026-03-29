{ pkgs, ... }:
{
  home.file.".p10k.zsh".source = ./.p10k.zsh;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    historySubstringSearch.enable = true;
    syntaxHighlighting.enable = true;
    
    plugins = [
      {
        name = "powerlevel10k";
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
        src = pkgs.zsh-powerlevel10k;
      }
    ];

    initContent = ''
      [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
    '';
  };
}
