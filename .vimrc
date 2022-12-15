" Settings
set nocompatible
set relativenumber
set wildmenu
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set clipboard+=unnamedplus

" Plugins
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'itchyny/vim-cursorword'
call plug#end()

" Keybinds
nmap <Space>b :split<Return><C-w>w
nmap <Space>v :vsplit<Return><C-w>w
map <Space>h <C-w>h
map <Space>k <C-w>k
map <Space>j <C-w>j
map <Space>l <C-w>l
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>
nmap <Space>q :q!
nmap <Space>w :w<Return>
nmap <Space>e :wq<Return>
