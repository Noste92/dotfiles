
shopt -s cdspell                 # Correct cd typos
shopt -s checkwinsize            # Update windows size on command
shopt -s histappend              # Append History instead of overwriting file
shopt -s cmdhist                 # Bash attempts to save all lines of a multiple-line command in the same history entry
shopt -s extglob                 # Extended pattern
shopt -s no_empty_cmd_completion # No empty completion
complete -cf sudo
if [[ -f /etc/bash_completion ]]; then
  . /etc/bash_completion
fi

[ -f "$HOME/.config/history.sh" ] && source "$HOME/.config/history.sh"
[ -f "$HOME/.config/shortcutrc.sh" ] && source "$HOME/.config/shortcutrc.sh"
[ -f "$HOME/.config/aliasrc.sh" ] && source "$HOME/.config/aliasrc.sh"

if which starship &>/dev/null; then
  eval "$(starship init bash)"
fi

if which tmux &>/dev/null; then
  if [ "$TMUX" = "" ]; then
      tmux;
  fi
fi
