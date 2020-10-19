call plug#begin('~/.local/share/nvim/plugged')

" For deoplete autocompletion pip install pynvim jedi
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

" Auto-pairs quotes and brackets
Plug 'jiangmiao/auto-pairs'

" Plug 'scrooloose/nerdcommenter'

" File tree
Plug 'scrooloose/nerdtree'

" UI related
Plug 'chriskempson/base16-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'phanviet/vim-monokai-pro'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" Syntax check (pip install pylint)
Plug 'neomake/neomake'

" Editorconfig
Plug 'editorconfig/editorconfig-vim'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Lightline
Plug 'itchyny/lightline.vim'

" syntax check
" Plug 'w0rp/ale'

" Autocomplete
" Plug 'ncm2/ncm2'
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'

" Formater (pip install yapf)
Plug 'sbdchd/neoformat' 

call plug#end()

" Deoplete autocompletion
" Use C-P, C-N for list navigation
let g:deoplete#enable_at_startup = 1

" Neoformat
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" Neomake
let g:neomake_python_enabled_makers = ['pylint']

" Nerdtree
let NERDTreeIgnore = [
    \'\.egg-info$',
    \'\.sw[pon]$',
    \'\.vagrant$',
    \'\.venv$',
    \'\.o$',
    \'\.out$',
    \'\.git$',
    \'__pycache__$',
    \]

" Themes
let base16colorspace=256
set background=dark
colorscheme monokai_pro

if has("termguicolors")
    set termguicolors
endif

let g:lightline = {
    \'colorscheme': 'monokai_pro',
    \}

filetype on
filetype plugin on
filetype indent on

syntax on
set encoding=utf8
set textwidth=79
set nowrap
set number
set wildmenu		" visual autocomplete for command menu
set showmatch		" highlight matching [{()}]
set ignorecase		" ignore case in search
set incsearch		" search as characters are entered
set fileformats=unix	" use Unix line endings
" set cursorline
" set noruler

set tabstop=4		" number of visual spaces per TAB
set softtabstop=4	" number of spaces in tab when editing
set shiftwidth=4
set smarttab
set expandtab		" tabs are spaces
set autoindent		" auto indent based on previous line

au BufNewFile,BufRead *.js,*.json,*.html,*.css,*.yaml
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Preview window close
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
