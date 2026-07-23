if command -v eza &> /dev/null; then
	# Better ls
	alias ls='eza --icons'

	# Detailed listing
	alias ll='eza -lh --icons --git'

	# Detailed listing including hidden files
	alias la='eza -lah --icons --git'

	# Tree view
	alias tree='eza --tree --icons'

	# Reuse ls completions for eza (avoids defining a separate completion function)
	compdef eza=ls

else
	alias ls='ls --color'
fi

if command -v batcat &> /dev/null; then
	# Better cat
	alias cat='batcat'
fi

# =========================================================
# Core utilities
# =========================================================

if command -v rg &> /dev/null; then
	alias grep='rg --color=auto'
fi

alias diff='diff --color=auto'
alias df='df -h'

# =========================================================
# Navigation
# =========================================================

alias -- -='cd -'  # -- prevents - being parsed as a flag; cd - jumps to previous directory

lf() { # zsh follow lf navigation
    tmp=$(mktemp)
    command lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir=$(cat "$tmp")
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

alias gr='cd $(git rev-parse --show-toplevel)'

# =========================================================
# Editor
# =========================================================

if command -v nvim &> /dev/null; then
	alias vim='nvim'
fi

# =========================================================
# Git
# =========================================================

alias glog='PAGER="less -F -X" git log'                              # -F quit if one screen, -X no clear on exit
alias gadog='PAGER="less -F -X" git log --all --decorate --oneline --graph'
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

# =========================================================
# Video
# =========================================================

alias stream='mpv av://v4l2:/dev/video4 --fullscreen --demuxer-lavf-o=input_format=mjpeg,framerate=30 --profile=low-latency --untimed'
