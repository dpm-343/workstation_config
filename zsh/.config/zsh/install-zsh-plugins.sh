#!/usr/bin/env bash

# 1. Define the local installation directory
PLUGIN_DIR="$HOME/.zsh/plugins"
mkdir -p "$PLUGIN_DIR"

# 2. List of plugins to install (GitHub repository paths)
PLUGINS=(
    "zdharma-continuum/fast-syntax-highlighting"
    "zsh-users/zsh-autosuggestions"
    "zsh-users/zsh-history-substring-search"
    "jeffreytse/zsh-vi-mode"
)

echo "Downloading plugins to $PLUGIN_DIR..."

# 3. Clone each plugin repository if it doesn't already exist
for repo in "${PLUGINS[@]}"; do
    plugin_name=$(basename "$repo")
    target_path="$PLUGIN_DIR/$plugin_name"
    
    if [ ! -d "$target_path" ]; then
        echo "Cloning $plugin_name..."
        git clone --depth=1 "https://github.com" "$target_path"
    else
        echo "$plugin_name is already installed."
    fi
done

# 4. Block of text to append to ~/.zshrc
# Note: zsh-history-substring-search MUST be loaded after fast-syntax-highlighting
read -r -d '' ZSHRC_BLOCK << 'EOF'

# --- MANUALLY MANAGED PLUGINS ---
source "$HOME/.zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh"
source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "$HOME/.zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
# ---------------------------------
EOF

# 5. Safely append to ~/.zshrc if it hasn't been added yet
if ! grep -q "MANUALLY MANAGED PLUGINS" "$HOME/.zshrc" 2>/dev/null; then
    echo "Adding plugin loading commands to ~/.zshrc..."
    echo "$ZSHRC_BLOCK" >> "$HOME/.zshrc"
else
    echo "Plugin loading commands are already present in ~/.zshrc."
fi

echo "Installation complete! Run 'source ~/.zshrc' or open a new terminal to activate."

