syn on
set number
set encoding=utf-8

" Whitespace settings
set tabstop=2
set shiftwidth=2
set expandtab
set list
set autoindent

" Search config
set ignorecase
set smartcase

" Rulers
set ruler

" Emmet config
let g:user_emmet_expandabbr_key = '<c-e>'

" NERDTree config
nnoremap <C-t> :NERDTreeToggle<CR>

" Bundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'

" Extra bundles
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'kchmck/vim-coffee-script'

" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim
