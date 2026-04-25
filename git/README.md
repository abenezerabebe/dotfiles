# git

## Files

| File | Committed | Purpose |
|---|---|---|
| `.gitconfig` | Yes | Base config — includes `.gitconfig.local`, editor, tools, rebase. |
| `.gitconfig.local` | No | Name and email. Copy from `.gitconfig.local.example`. |
| `.gitconfig.local.example` | Yes | Template for `.gitconfig.local`. |
| `.gitignore_global` | Yes | Global ignore patterns applied to every repo. |

## Config

| Setting | Value |
|---|---|
| Editor | `vim` |
| `rebase.autosquash` | `true` — `fixup!` / `squash!` commits auto-sort on rebase |
| `grep.lineNumber` | `true` |
| `color.ui` | `auto` |
| Diff tool | `vimdiff` (default) |
| Merge tool | `vimdiff` (default) |
| Global gitignore | `~/.gitignore_global` |

## Diff tools

```bash
git difftool              # opens vimdiff (default)
git difftool -t intellij  # opens IntelliJ diff
git mergetool             # opens vimdiff (default)
git mergetool -t intellij # opens IntelliJ 3-way merge
```

## Work config

Repos under `~/src/` automatically load `~/src/.gitconfig` via `includeIf`. That file holds work-specific settings and is not committed here.

## New machine setup

```bash
cp git/.gitconfig.local.example ~/.gitconfig.local
# fill in name and email

ln -sf ~/src/dotfiles/git/.gitconfig ~/.gitconfig
ln -sf ~/src/dotfiles/git/.gitignore_global ~/.gitignore_global
```
