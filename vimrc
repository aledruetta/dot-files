""" Commands Help
"
""" Vundle
" :PluginList           - lists configured plugins
" :PluginInstall        - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo     - searches for foo; append `!` to refresh local cache
" :PluginClean          - confirms removal of unused plugins; append `!` to auto-approve removal
" :h vundle             - help
"
""" Fugitive
" :Git [command]        - arbitrary Git command
" :h fugitive           - help
"
""" Whitespaces
" :FixWhitespaces       - By default it operates on the entire file.
"                         Pass a range (or use V to select some lines)
"                         to restrict the portion of the file that gets
"                         fixed.
""" NERDTree
" :NERDTree [path]
" :NERDTreeToggle
" :NERDTreeClose
" :h NERDTree

set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()           " required

filetype plugin indent on   " required

syntax on
set nowrap
set encoding=utf8
set number
set cursorline
set noruler
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]
set ignorecase          " ignore case in search
set fileformats=unix    " use Unix line endings
set incsearch           " search as characters are entered

" fold configuration
set foldenable          " enabling folding
nnoremap <space> za
set foldmethod=indent   " fold based on indent level
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" tab configuration
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4
set smarttab
set expandtab           " tabs are spaces
set autoindent          " auto indent based on previous line
set textwidth=79

let python_highlight_all = 1

au BufNewFile,BufRead *.js
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile,BufRead *.json
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile,BufRead *.html
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile,BufRead *.css
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile,BufRead *.ino
    \ set tabstop=4
    \ softtabstop=4
    \ shiftwidth=4

set laststatus=1
set t_Co=256
set background=dark

""" Plugin Configurations

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    colorscheme zenburn
endif

" Syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_html_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['eslint', 'tern_lint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
"https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt
