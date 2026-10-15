# Powerlevel10k instant prompt — .zshrc の先頭付近に置く必要がある。
# 全初期化を待たずにプロンプトを即時表示する（体感速度の主因）。
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# nodebrew（Node.js / npm。Mason の pyright・jsonls 等がターミナル外の Neovim でも npm を参照できるよう init.lua でも PATH を足している）
export PATH="$HOME/.nodebrew/current/bin:$PATH"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

eval "$(sheldon source)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion — ダンプが新しい日は -C で安全監査をスキップして高速化
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Editor
export EDITOR=nvim
if (( ${+commands[nvim]} )); then
  alias vi=nvim
  alias vim=nvim
fi

# direnv
eval "$(direnv hook zsh)"


# Added by Antigravity CLI installer
export PATH="/Users/sarukiti/.local/bin:$PATH"

export STM32CubeMX_PATH=/Applications/STMicroelectronics/STM32CubeMX.app/Contents/Resources

# GitHub MCP server token（gh のトークンを環境変数へ展開。~/.claude.json の Authorization ヘッダーが ${GITHUB_MCP_TOKEN} を参照する）
if (( ${+commands[gh]} )); then
  export GITHUB_MCP_TOKEN="$(gh auth token 2>/dev/null)"
fi
# Unity CLI
. "/Users/sarukiti/.unity/env"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Added by Antigravity IDE
export PATH="/Users/sarukiti/.antigravity-ide/antigravity-ide/bin:$PATH"
