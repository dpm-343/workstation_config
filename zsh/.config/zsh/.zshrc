# ---------------------------------------------------------
# Main Zsh Configuration Entry-Point
# ---------------------------------------------------------

# Load your custom scripts using absolute paths
[[ -f "$ZDOTDIR/bindings.zsh" ]] && source "$ZDOTDIR/bindings.zsh"
[[ -f "$ZDOTDIR/aliases.zsh" ]]  && source "$ZDOTDIR/aliases.zsh"
[[ -f "$ZDOTDIR/plugins.zsh" ]]  && source "$ZDOTDIR/plugins.zsh"
[[ -f "$ZDOTDIR/fzf.zsh" ]]      && source "$ZDOTDIR/fzf.zsh"
[[ -f "$ZDOTDIR/prompt.zsh" ]]   && source "$ZDOTDIR/prompt.zsh"

# Initialize Starship Prompt (if you use it)
export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi
