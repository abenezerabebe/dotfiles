# zsh

## Files

| File | Committed | Purpose |
|---|---|---|
| `.zshenv.shared` | Yes | Loaded by every shell (login + interactive). Sets PATH, jenv, pyenv, nvm, EDITOR. |
| `.zprofile` | Yes | Login shell only. Homebrew env, pipx, JetBrains Toolbox path. |
| `.zshrc` | Yes | Interactive shell. Prompt, completions, SDK lazy-loaders, aliases. |
| `.zshrc.local` | No | Machine-specific vars (e.g. work credentials). Copy from `.zshrc.local.example`. |
| `.zshrc.secrets` | No | API keys and credentials. Never commit. |

## Tools

| Tool | How it's loaded | Purpose |
|---|---|---|
| [Homebrew](https://brew.sh) | `.zprofile` + `.zshenv.shared` | Package manager |
| [pyenv](https://github.com/pyenv/pyenv) | `.zshenv.shared` | Python version management (uses built-in `venv` for virtual envs) |
| [nvm](https://github.com/nvm-sh/nvm) | `.zshenv.shared` (lazy) | Node version management |
| [jenv](https://www.jenv.be) | `.zshenv.shared` | Java version management |
| [zsh-completions](https://github.com/zsh-users/zsh-completions) | `.zshrc` | Extra tab completions |
| [zsh-git-prompt](https://github.com/olivierverdier/zsh-git-prompt) | `.zshrc` | Git branch/status in prompt |
| [base16-shell](https://github.com/tinted-theming/base16-shell) | `.zshrc` | Sets terminal palette to active base16 theme. Default: `tomorrow-night`. Switch with `base16_<theme>`. |

## Aliases

| Alias | Command |
|---|---|
| `ll` | `ls -alF` |
| `la` | `ls -A` |
| `l` | `ls -CF` |

## New machine setup

```bash
cp zsh/.zshrc.local.example ~/.zshrc.local
# fill in work credentials, custom paths, etc.

ln -sf ~/src/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/src/dotfiles/zsh/.zprofile ~/.zprofile
ln -sf ~/src/dotfiles/zsh/.zshenv.shared ~/.zshenv.shared
```
