" Commands
"
" vim-trailing-whitespace (git@github.com:bronson/vim-trailing-whitespace.git)
" :FixWhitespace
"
" fugitive (git@github.com:tpope/vim-fugitive.git)
" :Git [git-command]
"
" python-mode (git@github.com:klen/python-mode.git)
" :PymodeLint -- Check code in current buffer
" :PymodeLintToggle -- Toggle code checking
" :PymodeLintAuto -- Fix PEP8 errors in current buffer automatically
" :PymodeDoc <args>
"
" vim-virtualenv
" :VirtualEnvList
" :VirtualEnvActivate project
" :VirtualEnvDeactivate
"
" vim-hardy
" :ArduinoUpload
" :ArduinoVerify
"
" General settings
set nocompatible            "Allow Vim-only settings even if they break vi keybindings.
filetype on                 "Enable filetype detection
set completeopt=menu        "PymodeDoc no window
set ignorecase              "Ignore case in search
set scrolloff=5             "Number of lines to keep above/below cursor
set smartcase               "Only ignore case when all letters are lowercase
set number                  "Show line numbers
set wildmenu				"Visual autocomplete for command menu
set fileformats=unix        "Use Unix line endings
set history=300             "Number of commands to remember
set noshowmode              "Don't show mode (because of airline)
set noshowmatch             "Don't show matching brackets/parentheses
set backspace=2             "Use standard backspace behavior
set incsearch               "Find as you type
set hlsearch                "Highlight matches in search
set ruler                   "Show line and column number
set formatoptions=1         "Don't wrap text after a one-letter word
set linebreak               "Break lines when appropriate
set cursorline				"Highlight current line
set encoding=utf-8
syntax enable               "Enable syntax highlighting
syntax on
color dracula
let python_highlight_all=1  "For full syntax highlighting

" Indentation
filetype plugin indent on
set tabstop=2
set softtabstop=0
set shiftwidth=2
set noexpandtab
set autoindent              "Auto indent based on previous line
set smarttab                "Respect space/tab settings
set smartindent             "Smart autoindenting on new line
set textwidth=79

" Bindings
nnoremap B ^
nnoremap E $

" Arduino
augroup arduino
    au!
    autocmd BufRead,BufNewFile *.ino set filetype=arduino
    autocmd Filetype arduino setlocal softtabstop=2 shiftwidth=2
augroup END

" Pathogen plugin installator
execute pathogen#infect()

" Settings Pydiction Plugin (https://github.com/vim-scripts/Pydiction)
let g:pydiction_location='/home/alejandro/.vim/bundle/pydiction/complete-dict'

" Settings vim-hardy plugin (https://github.com/4Evergreen4/vim-hardy)
" let g:hardy_arduino_path='/home/alejandro/Apps/arduino-1.6.6/arduino'

" Settings syntastic plugin (https://github.com/scrooloose/syntastic)
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0

" Python-mode plugin settings
let g:pymode_options_colorcolumn = 1
let g:pymode_folding = 0
let g:pymode_virtualenv = 1
" let g:pymode_doc = 0

" Settings airline plugin (https://github.com/bling/vim-airline)
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='dark'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_min_count=2
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1

" configure which mode colors should be used in tmux statusline >
"let airline#extensions#tmuxline#color_template='normal'
"let airline#extensions#tmuxline#color_template='insert'
"let airline#extensions#tmuxline#color_template='visual'
"let airline#extensions#tmuxline#color_template='replace'

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.c,*.h match BadWhitespace /\s\+$/
