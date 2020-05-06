#   ___   ___        
#  / _ | / (_)__ ____
# / __ |/ / / _ `(_-<
#/_/ |_/_/_/\_,_/___/
  # AUTOCOLOR 
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
  # MODIFIED COMMANDS
    alias mkdir='mkdir -p -v'
    if which colordiff &>/dev/null; then
      alias diff='colordiff'
    fi
    if which nvim &>/dev/null; then
      alias vim='nvim'
    fi
  # PRIVILEGED ACCESS
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
  # PKG ALIASES
    if which pacman &>/dev/null; then
    	alias pacman='sudo pacman'
    fi
    if which apt &>/dev/null; then
    	alias apt='sudo apt'
    fi
  # LS
    alias ls='ls -hF --color=auto'
    alias lr='ls -R'
    alias ll='ls -alh'
    alias la='ll -A'
    alias lm='la | less'
