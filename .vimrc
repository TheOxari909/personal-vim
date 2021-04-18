set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'

call plug#end()

let NERDTreeShowHidden=1

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * lcd %:p:h

syntax on

set noerrorbells
set tabstop=4 shiftwidth=4 expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
