"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Owner/Maintainer:
"	Thorsten Winkler
"	thorsten.winkler85@gmail.com
"
" Version:
" 	2017-03-24 - First Edition
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load pathogen which is used for easy plugin handling
    execute pathogen#infect()

" Proper backup and tmp dirs are prefered
    set backup
    set backupdir=~/.vim/backup//
    set directory=~/.vim/tmp//

" Enable autosave and undofiles
    au FocusLost * :wa

    if has('persistent_undo')
        set undofile
        set undodir=~/.vim/undo//
    endif

" Don't wrap lines at all
    "set nowrap

" Turn on line numbers
    set nonu
    "set nu
    "set rnu

" Set Terminal to 256 colors
    "set term=screen-256color
    set t_Co=256

" Enable syntax highlighting
    syntax enable
    " colorscheme abbott
     colorscheme leo
    " colorscheme mopkai

" Highlight currentline
    set cursorline
    autocmd bufenter * highlight CursorLine ctermbg=235 guibg=#2c2d27

" Highlight search matches
    set hlsearch

" Use spaces instead of tabs
    set expandtab

" Ensures that tabs are only used for indentation, while spaces are used everywhere else
    set smarttab

" copy the indentation from the previous line
    set autoindent

" 1 tab == 4 spaces (If softtabstop equals tabstop and expandtab is not set,
" vim will always use tabs)
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4

" Set utf8 as standard encoding and en_US as the standard language and
" fileformat unix
    set fileformat=unix
    set encoding=utf-8

" Switch between paste and nopaste mode so that no autoindent is done during
" copy/paste
set pastetoggle=<F3>

" Recommended settings for "syntastic"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sh_checkers = ['Bashate','checkbashisms','sh','ShellCheck']
