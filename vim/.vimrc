" personal namespace let mapleader = "\<Space>"

if filereadable(expand("~/.vimrc_background"))
        "  let base16colorspace=256
  source ~/.vimrc_background
endif

" use same clipboard between vim and rest of macos
set clipboard=unnamed

" easy access to the start of a line
nmap 0 ^

set tabstop=4 "number of visual spaces per TAB

set softtabstop=4 " number of spaces in tab when editing

set expandtab " tabs are spaces

set number " show line numbers

set showcmd " show command in bottom bar

set wildmenu " visual autocomplete for command menu

set lazyredraw " redraw only when necessary

set showmatch " highlight matching parenthesis, braces, etc

set incsearch " search as characters are entered

set hlsearch " highlight search matches

set foldenable " enable folding

set foldlevelstart=10 " open most folds by default

set foldmethod=indent " fold based on indent level

syntax on " enable syntax highlighting

set list " show whitespace

" hide pipe characters in splits
set fillchars+=vert:\ 

"split open .vimrc
nmap <leader>vr :sp $MYVIMRC<cr>

" Move up and down by visible lines if current line is wrapped
nmap j gj
nmap k gk

" ctrlp Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']

" netrw recursively removes files and directory
:let g:netrw_localrmdir='rm -r'

" Run Prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Run Black on save
autocmd BufWritePre *.py execute ':Black'

" sync vim with base16-shell
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'python/black'
Plug 'udalov/kotlin-vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'chriskempson/base16-vim'
call plug#end()
