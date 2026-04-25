# ------------------------------
# Shared environment
# ------------------------------
[[ -r "$HOME/.zshenv.shared" ]] && source "$HOME/.zshenv.shared"

# ------------------------------
# Homebrew
# ------------------------------
eval "$(/opt/homebrew/bin/brew shellenv)"

# ------------------------------
# pipx
# ------------------------------
export PATH="$PATH:$HOME/.local/bin"

# ------------------------------
# JetBrains Toolbox
# ------------------------------
export PATH="$PATH:$HOME/Library/Application Support/JetBrains/Toolbox/scripts"
