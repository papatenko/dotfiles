" Settings
set nocompatible
set relativenumber
set wildmenu
filetype on
filetype plugin on
filetype indent on
syntax on
set number
set clipboard=unnamedplus

" Keybinds
let mapleader = " "

nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l

nnoremap <Space>w :w<CR>
nnoremap <Space>q :q<CR>
nnoremap <Space>e :wq<CR>

nnoremap \ :sp<CR><C-w>w
nnoremap Z :sp<CR><C-w>w
nnoremap | :vs<CR><C-w>w

" Disable Keybinds

nnoremap <C-p> <Nop>
