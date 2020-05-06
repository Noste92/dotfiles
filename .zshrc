[ -f "$HOME/.config/functionsrc.sh" ] && source "$HOME/.config/functionsrc.sh"
[ -f "$HOME/.config/aliasrc.sh" ] && source "$HOME/.config/aliasrc.sh"
[ -f "$HOME/.config/envrc.sh" ] && source "$HOME/.config/envrc.sh"

if which starship &>/dev/null; then
    eval "$(starship init zsh)"
fi