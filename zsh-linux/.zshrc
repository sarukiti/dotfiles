export TERM=xterm-256color

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Lima: make sure iptables and mount.fuse3 are available
export PATH="$PATH:/usr/sbin:/sbin"

# nodebrew
export PATH="$HOME/.nodebrew/current/bin:$PATH"

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

eval "$(sheldon source)"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion
autoload -Uz compinit && compinit

# Editor
export EDITOR=nvim
if (( ${+commands[nvim]} )); then
  alias vi=nvim
  alias vim=nvim
fi

# direnv
eval "$(direnv hook zsh)"
# Lima BEGIN
# Make sure iptables and mount.fuse3 are available
PATH="$PATH:/usr/sbin:/sbin"
export PATH
# Lima END
