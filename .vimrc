""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
scriptencoding utf-8
set encoding=utf-8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Owner/Maintainer:
"	Thorsten Winkler
"	thorsten.winkler85@gmail.com
"	:help <options>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ==============================================================================
" Start vim-plug
"
call plug#begin()
Plug 'https://github.com/jiangmiao/auto-pairs'
Plug 'https://github.com/morhetz/gruvbox'
Plug 'https://github.com/ntpeters/vim-better-whitespace'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/sheerun/vim-polyglot'
Plug 'https://github.com/tpope/vim-sensible' " Not sure if really needed
"Plug 'https://github.com/tpope/vim-repeat.git' " E.g. required by vim-surround
"Plug 'https://github.com/tpope/vim-surround.git'
"Plug 'https://github.com/vim-syntastic/syntastic' " really required with vim-polyglot
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/Yggdroot/indentLine.git'
call plug#end()

"===============================================================================
" Allow 256 color themes (must set before theme)
"set term=screen-256color
"set term=xterm-256color
set t_Co=256

" ==============================================================================
" Turn on syntax highlighting and set theme
" >>> Plug 'https://github.com/morhetz/gruvbox' <<<
colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast = "hard"

" Highlight margin
" https://blog.hanschen.org/2012/10/24/different-background-color-in-vim-past-80-columns/
" https://vim.fandom.com/wiki/Xterm256_color_names_for_console_Vim
if exists('+colorcolumn')
    execute "set colorcolumn=" . join(range(81,335), ',')
    autocmd bufenter * highlight ColorColumn ctermbg=232 guibg=#2c2d27
endif

" ==============================================================================
" Defaults
set nocompatible " old vi mode not required any more. Default in vim
set title " terminal must support it or configured correctly
set ttyfast
set ruler " see info at the bottom right...
set laststatus=2 " last status line at the bottom
set backspace=indent,eol,start "allow backspacing over everything in insert mode (including automatically inserted indentation, line breaks and start of insert) you can set the backspace option
" Use system-wide clipboard
set clipboard=unnamed

" ==============================================================================
" Indendation
" copy the indentation from the previous line
set autoindent
" customize indentation per file type (/usr/local/share/vim/vim81/indent)
" https://vim.fandom.com/wiki/Indenting_source_code
filetype plugin indent on

" Set some tab stuff here
" 1 tab == 4 spaces (If softtabstop equals tabstop and expandtab is not set,
" vim will always use tabs)
set shiftwidth=4
set softtabstop=4
set tabstop=4
" Ensures that tabs are only used for indentation, while spaces are used everywhere else
set smarttab
" :help expandtab
set expandtab
" >>> Plug 'https://github.com/Yggdroot/indentLine.git'
let g:indentLine_enabled = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '.'
let g:indentLine_color_term = 243
let g:indentLine_char = '|'

" ==============================================================================
" Backup and tmp dirs
set backup
" // absolute path of backup and swap files (separated by % signs)
set backupdir=~/.vim/backup//
set directory=~/.vim/tmp//

if has('persistent_undo')
    set undofile
    set undodir=~/.vim/undo//
endif

" ==============================================================================
" Don't wrap lines at all
set nowrap

" ==============================================================================
" Turn on line numbers and relative line numbers
set nu
set rnu

" ==============================================================================
" Highlight currentline
set cursorline
autocmd bufenter * highlight CursorLine cterm=bold

" ==============================================================================
" Search
" When on, the \":substitute\" flag 'g' is default on
" set gdefault
" Search during typing
set incsearch
" Highlight search matches
set hlsearch
" Only case sensitive if a uppercase letter is used in search
" https://vim.fandom.com/wiki/Searching
set ignorecase
set smartcase
" ==============================================================================
" NERDTree
" >>> Plug 'https://github.com/scrooloose/nerdtree'
" >>> Plug 'https://github.com/Xuyuanp/nerdtree-git-plugin'
" >>> https://unicode-table.com/

" Start NERDTree automatically at vim start with autocmd
" autocmd vimenter * NERDTree
" <ctrl>+n to start NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


" ==============================================================================
" Airline


" ==============================================================================
" Syntastic
"
"
"set mouse+=a
map <F9> :make debug<CR><CR><CR>
map <F10> :make clean<CR><CR><CR>
map <F11> :make all<CR><CR><CR>
