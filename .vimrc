""""""""""""
" Settings "
""""""""""""

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Lets me see the rest of my possible commands
set wildmenu

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

"""""""""""
" Plugins "
""""""""""" 

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'itchyny/vim-cursorword'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
