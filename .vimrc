" Settings
set nocompatible
set relativenumber
set wildmenu
filetype on
filetype plugin on
filetype indent on
syntax on
set number

" Keybinds
let mapleader = " "

nnoremap <leader>h <C-w>h
nnoremap <leader>k <C-w>k
nnoremap <leader>j <C-w>j
nnoremap <leader>i <C-w>i

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>e :wq<CR>

nnoremap <leader>d :bd

nnoremap <leader>b :sp<CR><C-w>w
nnoremap <leader>d :sp<CR><C-w>w

nnoremap <leader>Z :
