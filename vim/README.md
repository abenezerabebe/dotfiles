# vim

Plugin manager: [vim-plug](https://github.com/junegunn/vim-plug) (auto-bootstrapped on first launch).

## Plugins

| Plugin | Purpose |
|---|---|
| [tpope/vim-sensible](https://github.com/tpope/vim-sensible) | Sensible defaults everyone can agree on |
| [ctrlpvim/ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim) | Fuzzy file finder (`Ctrl+P`) |
| [prettier/vim-prettier](https://github.com/prettier/vim-prettier) | Auto-format JS/TS/CSS/JSON/HTML/YAML on save |
| [python/black](https://github.com/psf/black) | Auto-format Python on save |
| [udalov/kotlin-vim](https://github.com/udalov/kotlin-vim) | Kotlin syntax highlighting |
| [editorconfig/editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) | Respect `.editorconfig` files |
| [chriskempson/base16-vim](https://github.com/chriskempson/base16-vim) | base16 color schemes (syncs with base16-shell) |

## Key bindings

| Key | Action |
|---|---|
| `Space` | Leader key |
| `<leader>vr` | Split-open `.vimrc` |
| `0` | Jump to first non-blank character |
| `j` / `k` | Move by visible line (respects wrapping) |

## Settings

| Setting | Value |
|---|---|
| Tab width | 4 spaces (expanded) |
| Line numbers | On |
| Search | Incremental + highlighted |
| Folding | By indent, most folds open |
| Clipboard | Shared with macOS (`unnamed`) |
| Whitespace | Visible (`set list`) |

## Install

```bash
vim +PlugInstall +qall
```
