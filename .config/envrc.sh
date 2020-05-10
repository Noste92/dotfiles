export PATH=$HOME/bin:$HOME/.cargo/bin:$PATH
export LANG="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"
if which nvim &>/dev/null; then
    export EDITOR="nvim"
elif which vim &>/dev/null; then
    export EDITOR="vim"
else
    export EDITOR="nano"
fi