" General
set ttyfast
set lazyredraw
set encoding=utf-8
set nocompatible
filetype off

" Backups
set nobackup
set nowritebackup
set noswapfile

" Whitespace
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace
set backspace=indent,eol,start
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set copyindent
set smartindent
set nowrap

" Search
set incsearch
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig
set wildignore+=*.DS_Store,*/.sass-cache/,*/.vagrant/,*/tmp/*,*.pdf,*/node_modules/*,*/dist/*,*/bower_components/*
set hlsearch

" Bundles
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'bogado/file-line'
Plugin 'morhetz/gruvbox'

call vundle#end()

filetype plugin indent on

" Colorscheme
set background=dark
colorscheme gruvbox

" Remaps
nnoremap ; :
nnoremap j gj
nnoremap k gk
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR> " grep word under cursor
noremap tt :tabnew<cr>
noremap tp :tabp<cr>
noremap tn :tabn<cr>
noremap ,v :vsp^<cr>
noremap ,h :split^<cr>
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>
