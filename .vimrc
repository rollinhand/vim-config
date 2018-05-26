"-------------------------------------------------------------------------- 
" Configuration file for Vim
" Plugins are managed by Vundle
"
" Author:  Björn Berg, rollin.hand@gmx.de
" Version: 1.0
"-------------------------------------------------------------------------- 

filetype plugin indent on
syntax enable

set term=xterm

""""""""""""""""""""""""""""""""
" Configuration
""""""""""""""""""""""""""""""""
" Show linenumbers
set number
set ruler

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

set laststatus=2

" Define colorscheme and plugins
if (has("termguicolors"))
  set termguicolors
endif

set background=dark
colorscheme monokai
let g:airline_theme='molokai'

""" Disable folding by startup
set nofoldenable

""" Emulate system clipboard
if has('win32')
  :vnoremap <C-c> "+y
  :inoremap <C-v> <ESC>"+pa
elseif has('macunix')
  :vnoremap <D-c> "+y
  :inoremap <D-v> <ESC>"+pa
endif
