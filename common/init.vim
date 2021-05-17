call plug#begin('~/.local/share/nvim/plugged')

    Plug 'airblade/vim-gitgutter'
    Plug 'majutsushi/tagbar'
    Plug 'lepture/vim-jinja'
    Plug 'pangloss/vim-javascript'
    Plug 'alvan/vim-closetag'
    
    " For deoplete autocompletion pip install pynvim jedi
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    
    " Auto-pairs quotes and brackets
    Plug 'jiangmiao/auto-pairs'
    
    " Folding
    Plug 'tmhedberg/simpylfold'
    
    " File tree
    Plug 'scrooloose/nerdtree'
    " Plug 'preservim/nerdtree'
    " Plug 'jistr/vim-nerdtree-tabs'
    
    " UI related
    " Plug 'chriskempson/base16-vim'
    " Plug 'lifepillar/vim-solarized8'
    " Plug 'phanviet/vim-monokai-pro'
    " Plug 'rakr/vim-one'
    Plug 'mhartington/oceanic-next'
    Plug 'joshdick/onedark.vim'

    " light/airline
    " Plug 'itchyny/lightline.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Icons
    Plug 'ryanoasis/vim-devicons'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    
    " Better Visual Guide
    Plug 'Yggdroot/indentLine'
    
    " Syntax check (pip install pylint)
    Plug 'neomake/neomake'
    
    " Editorconfig
    Plug 'editorconfig/editorconfig-vim'

    " Tmux
    Plug 'christoomey/vim-tmux-navigator'
    
    " Formater (pip install yapf)
    Plug 'sbdchd/neoformat' 

    " Git
    Plug 'mhinz/vim-signify'
    Plug 'tpope/vim-fugitive'

call plug#end()

filetype plugin indent on
syntax on

set laststatus=2
set encoding=utf-8
set fileencoding=utf-8
" set textwidth=80
set nowrap
set number
set wildmenu		    " visual autocomplete for command menu
set showmatch		    " highlight matching [{()}]
set ignorecase		    " ignore case in search
set incsearch		    " search as characters are entered
set fileformats=unix	" use Unix line endings
" set cursorline
" set noruler

set tabstop=4		    " number of visual spaces per TAB
set softtabstop=4	    " number of spaces in tab when editing
set shiftwidth=4
set smarttab
set expandtab		    " tabs are spaces
set autoindent		    " auto indent based on previous line

set foldmethod=indent
au BufWinEnter * normal zR

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

let g:neoformat_try_formatprg = 1
augroup NeoformatAutoFormat
    autocmd!
    autocmd FileType javascript setlocal formatprg=prettier\
                                             \--stdin\
                                             \--print-width\ 80\
                                             \--single-quote\
                                             \--trailing-comma\ es5
    autocmd BufWritePre *.js Neoformat
augroup END

" Neomake
let g:neomake_python_enabled_makers = ['pylint']
let g:neomake_javascript_enabled_makers = ['eslint']
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)

" Nerdtree
let NERDTreeIgnore = [
    \'\.egg-info$',
    \'\.sw[pon]$',
    \'\.vagrant$',
    \'\.venv$',
    \'\.o$',
    \'\.out$',
    \'\.git$',
    \'\.pyc$',
    \'__pycache__$',
    \'node_modules$',
    \'package-lock.json$',
    \'tilix.json$',
    \'\.log$',
    \]

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0
map <leader>n :call NERDTreeToggle()<CR>
function NERDTreeToggle()
    NERDTreeTabsToggle
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
    else
        let g:nerdtree_open = 1
        wincmd p
    endif
endfunction

" Themes

set termguicolors
let base16colorspace=256
set t_Co=256
set t_ut=
set noshowmode
set background=dark
let g:one_allow_italics = 1

" let g:lightline = { 'colorscheme': 'onedark' }
try
    colorscheme OceanicNext
catch
    colorscheme onedark
endtry

" Vim airline theme
let g:airline_theme='minimalist'

" === Vim airline ==== "
" Enable extensions
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]

" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
  \ 'list': [ '%y', '%l/%L'],
  \ }

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled=0

if (has("termguicolors"))
    set termguicolors
endif

au BufNewFile,BufRead *.js,*.json,*.html,*.css,*.yaml
    \ set tabstop=2
    \ softtabstop=2
    \ shiftwidth=2

" Preview window close
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
