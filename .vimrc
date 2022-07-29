let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'ycm-core/YouCompleteMe'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'VundleVim/Vundle.vim'

call vundle#end()

filetype plugin indent on

call plug#begin('~/.vim/plugged')

Plug 'dense-analysis/ale'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'vim-scripts/AutoClose'

call plug#end()

let NERDTreeShowHidden=1

" Open the existing NERDTree on each new tab
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
autocmd BufEnter * lcd %:p:h

syntax on

set noerrorbells
set tabstop=2 shiftwidth=2 expandtab
set smartindent
set number
set nowrap
set smartcase
set noswapfile
set incsearch


" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" Close NERDTRee if last open in tab
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
