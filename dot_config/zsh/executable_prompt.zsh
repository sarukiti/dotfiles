#export GOPATH=/home/sarukiti/.local/
#function powerline_precmd() {
    #PS1="$($GOPATH/bin/powerline-go -error $? -jobs ${${(%):%j}:-0})"
#
    ## Uncomment the following line to automatically clear errors after showing
    ## them once. This not only clears the error for powerline-go, but also for
    ## everything else you run in that shell. Don't enable this if you're not
    ## sure this is what you want.
#
    ##set "?"
#}
#
#function install_powerline_precmd() {
  #for s in "${precmd_functions[@]}"; do
    #if [ "$s" = "powerline_precmd" ]; then
      #return
    #fi
  #done
  #precmd_functions+=(powerline_precmd)
#}
#
#if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    #install_powerline_precmd
#fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
