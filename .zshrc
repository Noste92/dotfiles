[ -f "$HOME/.config/history.sh" ] && source "$HOME/.config/history.sh"
[ -f "$HOME/.config/functionsrc.sh" ] && source "$HOME/.config/functionsrc.sh"
[ -f "$HOME/.config/aliasrc.sh" ] && source "$HOME/.config/aliasrc.sh"
[ -f "$HOME/.config/envrc.sh" ] && source "$HOME/.config/envrc.sh"
[ -f "$HOME/.config/completionrc.sh" ] && source "$HOME/.config/completionrc.sh"

if which starship &>/dev/null; then
    eval "$(starship init zsh)"
fi

if which tmux &>/dev/null; then
  if [ "$TMUX" = "" ]; then
      tmux;
  fi
fi
