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
" :NERDTreeRefresh
" :h NERDTree

set nocompatible            " be iMproved, required
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-syntastic/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'nvie/vim-flake8'
Plugin 'c.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'cquery-project/cquery'
Plugin 'lifepillar/vim-solarized8'
Plugin 'mhartington/oceanic-next'
Plugin 'rakr/vim-one'
Plugin 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'vim-airline/vim-airline'
" Plugin 'edkolev/tmuxline.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'fatih/vim-go'
Plugin 'ARM9/arm-syntax-vim'
Plugin 'jplaut/vim-arduino-ino'
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

au BufNewFile,BufRead *.sh
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

au BufNewFile,BufRead *.ino,*.pde set filetype=c++

" arm = armv6/7
au BufNewFile,BufRead *.s,*.S set filetype=arm
    \ tabstop=8
    \ softtabstop=8
    \ shiftwidth=8

set laststatus=1

""" Plugin Configurations

" Credit joshdick
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
" If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
" (see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Theme

set background=dark
" colorscheme OceanicNext
" colorscheme one
" colorscheme onehalfdark
colorscheme solarized8_flat

let g:airline_theme='onehalfdark'
" let g:airline_theme='oceanicnext'
" let g:airline_theme='one'

" let g:airline_powerline_fonts = 1

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
let g:syntastic_c_checkers=['gcc', 'avrgcc']
let g:syntastic_cpp_checkers=['gcc', 'avrgcc']
let g:syntastic_hpp_checkers=['gcc', 'avrgcc']
"https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt

" YouCompleteMe

let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

