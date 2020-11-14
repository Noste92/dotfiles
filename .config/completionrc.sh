# Completion configuration
CURRENT_SHELL="$(ps -hp $$|awk '{print $5}')"
if which gh &>/dev/null; then
  eval "$(gh completion -s $CURRENT_SHELL)"
fi
