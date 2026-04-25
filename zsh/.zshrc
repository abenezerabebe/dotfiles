# ------------------------------
# Shared environment (makes login + interactive shells consistent)
# ------------------------------
[[ -r "$HOME/.zshenv.shared" ]] && source "$HOME/.zshenv.shared"

##### Base shell hygiene #######################################################

set -o noclobber
set -o notify
set -o braceexpand
setopt prompt_subst

typeset -U path PATH FPATH

##### Prompt & completion ######################################################

if command -v brew >/dev/null 2>&1; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"
fi

autoload -Uz compinit
compinit -C

if command -v brew >/dev/null 2>&1 && [ -f "$(brew --prefix)/opt/zsh-git-prompt/zshrc.sh" ]; then
  source "$(brew --prefix)/opt/zsh-git-prompt/zshrc.sh"
  PROMPT='%B%m%~%b$(git_super_status) %# '
fi

##### Languages / SDKs #########################################################

# ---- Python ----
# pyenv setup (PYENV_ROOT, PATH, and `pyenv init`) is handled in .zshenv.shared.
# Fallback alias only matters in interactive shells, so it lives here.
if command -v /usr/bin/python3 >/dev/null 2>&1 && ! command -v pyenv >/dev/null 2>&1; then
  alias python="/usr/bin/python3"
fi

# ---- Node via nvm (lazy load) ----
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
  nvm() { unset -f nvm; . "$NVM_DIR/nvm.sh"; nvm "$@"; }
  node() { unset -f node; . "$NVM_DIR/nvm.sh"; node "$@"; }
  npm()  { unset -f npm;  . "$NVM_DIR/nvm.sh"; npm "$@"; }
  npx()  { unset -f npx;  . "$NVM_DIR/nvm.sh"; npx "$@"; }
fi

# ---- Gradle 7 ----
_addpath "/opt/homebrew/opt/gradle@7/bin"
export PATH

##### Google Cloud SDK #########################################################

if command -v brew >/dev/null 2>&1; then
  [ -f "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc" ] && \
    source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  [ -f "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc" ] && \
    source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

##### base16-shell #############################################################

export BASE16_SHELL_PATH="$HOME/.config/base16-shell"
if [ -s "$BASE16_SHELL_PATH/profile_helper.sh" ]; then
  export BASE16_THEME_DEFAULT="tomorrow-night"
  source "$BASE16_SHELL_PATH/profile_helper.sh"
fi

##### Secrets & local overrides ################################################

[ -f "$HOME/.zshrc.secrets" ] && source "$HOME/.zshrc.secrets"
[ -f "$HOME/.zshrc.local" ]   && source "$HOME/.zshrc.local"

##### Aliases ##################################################################

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

ulimit -n 10240
export PATH=/opt/spotify-devex/bin:$PATH
