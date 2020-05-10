
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

# BASH HISTORY 
# make multiple shells share the same history file
export HISTSIZE=1000            # bash history will save N commands
export HISTFILESIZE=${HISTSIZE} # bash will remember N commands
export HISTCONTROL=ignoreboth   # ingore duplicates and spaces
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'

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
