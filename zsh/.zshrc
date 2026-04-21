# PATH
export PATH="$HOME/.local/bin:$PATH"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# nodebrew（Node.js / npm。Mason の pyright・jsonls 等がターミナル外の Neovim でも npm を参照できるよう init.lua でも PATH を足している）
export PATH="$HOME/.nodebrew/current/bin:$PATH"

# Powerlevel10k (instant prompt はこの前に置く必要がある)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

# Completion
autoload -Uz compinit && compinit

# Editor
export EDITOR=vim

# direnv
eval "$(direnv hook zsh)"
