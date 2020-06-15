setopt appendhistory
export SAVEHIST=10
export HISTFILE=~/.histfile
export HISTSIZE=1000 
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth
export HISTIGNORE='&:ls:ll:la:cd:exit:clear:history'