# ~/.config/zsh/.zshenv

# ---------- XDG base directories ----------
# Centralizes config/cache/data locations
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# ---------- Editor ----------
# Default editor used by git, crontab, etc.
export EDITOR="nvim"
export VISUAL="nvim"

# ---------- Pager ----------
if command -v bat >/dev/null 2>&1; then
  export MANPAGER="bat -l man -p"
elif command -v batcat >/dev/null 2>&1; then
  export MANPAGER="batcat -l man -p"
fi

# ---------- GPG ----------
export GPG_TTY=$(tty)

# ---------- Starship ----------
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    # Verify that the SSH-specific file exists in ZDOTDIR
    if [ -f "$ZDOTDIR/starship-ssh.toml" ]; then
        export STARSHIP_CONFIG="$ZDOTDIR/starship-ssh.toml"
    else
        export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
    fi
else
    # Default local configuration path
    export STARSHIP_CONFIG="$ZDOTDIR/starship.toml"
fi

# ---------- PATH ----------
# Personal binaries/scripts
export PATH="$HOME/.local/bin:$PATH"
