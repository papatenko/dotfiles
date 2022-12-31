" Settings
set nocompatible
set relativenumber
set wildmenu
filetype on
filetype plugin on
filetype indent on
syntax on
set number

" interesting
" Plugins
" call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
" Plug 'itchyny/vim-cursorword'
" call plug#end()

" Keybinds
let mapleader = " "

map <C-h> <C-w>h
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-l> <C-w>l

nmap <Space>q :q!
nmap <Space>w :w<Return>
nmap <Space>e :wq<Return>

map<leader>r [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map<leader>pv :Ex<Return>

nmap Z :
