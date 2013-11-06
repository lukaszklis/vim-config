" Basic config
syn on
set number
set encoding=utf-8
set laststatus=2
set nocompatible
filetype off
syntax enable
filetype plugin indent on

" Whitespace config
set tabstop=2
set shiftwidth=2
set expandtab
set list
set autoindent
set nowrap

" Search config
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.DS_Store,*.orig

" Rulers
set ruler

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
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'chrismetcalf/vim-autocomplpop'
Bundle 'airblade/vim-gitgutter'
Bundle 'mileszs/ack.vim'
Bundle 'sheerun/vim-polyglot'

" Emmet config
let g:user_emmet_expandabbr_key = '<c-e>'

" NERDTree config
nnoremap <C-t> :NERDTreeToggle<CR>

" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Statusline config
set statusline=[%n]\ %<%f%m%r
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%{fugitive#statusline()}%=
set statusline+=%w\ <%{&fileformat}>%\=\ [%o]\ %l,%c%V\/%L\ \ %P
