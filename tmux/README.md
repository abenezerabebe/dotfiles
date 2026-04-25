# tmux

Prefix: `C-s` (replaces default `C-b`)

## Plugins

| Plugin | Purpose |
|---|---|
| [tmux-plugins/tpm](https://github.com/tmux-plugins/tpm) | Plugin manager |
| [tmux-plugins/tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) | Sensible defaults |
| [tmux-plugins/tmux-cpu](https://github.com/tmux-plugins/tmux-cpu) | CPU usage in status bar |

## Key bindings

| Key | Action |
|---|---|
| `C-s` | Prefix |
| `prefix r` | Reload `~/.tmux.conf` |
| `C-h/j/k/l` | Navigate panes (vim-style, no prefix needed) |
| `v` *(copy mode)* | Begin selection |
| `y` *(copy mode)* | Copy selection to macOS clipboard (`pbcopy`) |

## Settings

| Setting | Value |
|---|---|
| Mouse | On |
| Mode keys | vi |
| Scrollback history | 200,000 lines |
| Default shell | `/bin/zsh -l` (login shell, loads full env) |
| Pane border | Top, shows pane title |
| Status bar | Bottom — CPU usage + date/time |
| Colors | base16 palette (follows active `base16-shell` theme) |
| Env sync | `DISPLAY`, `SSH_AUTH_SOCK`, `PATH`, `JAVA_HOME` passed into new sessions |

## Install plugins

```bash
# Inside tmux, press:
prefix + I
```
