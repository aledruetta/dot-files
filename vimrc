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
Plugin 'vim-syntastic/syntastic'
call vundle#end()           " required

filetype plugin indent on   " required

syntax on
set nowrap
set encoding=utf8
set number
set ruler
set ignorecase          " ignore case in search
set fileformats=unix    " use Unix line endings

" tab configuration
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent          " auto indent based on previous line
set textwidth=79

set laststatus=2
set t_Co=256
set background=dark

""" Plugin Configurations

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
"'eslint', 'tern_lint'] https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt
