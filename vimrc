" General
set ttyfast
set lazyredraw
set encoding=utf-8
set nocompatible
set ruler
set clipboard=unnamed
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
Plugin 'lukaszklis/badwolf'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'

call vundle#end()

syntax on
filetype plugin indent on

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_match_window='order:ttb,max:20'

if executable('ag')
  " Use ag (the Silver Searcher) in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Colorscheme
let g:badwolf_css_props_highlight=1
let g:badwolf_html_link_underline=0
colorscheme badwolf

" Emmet
let g:user_emmet_expandabbr_key='<c-e>'

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
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" CtrlP + Rails
map ,ja :CtrlP app<CR>
map ,jA :CtrlP app/assets<CR>
map ,jc :CtrlP app/controllers<CR>
map ,jC :CtrlP config<CR>
map ,jd :CtrlP db<CR>
map ,jh :CtrlP app/helpers<CR>
map ,jj :CtrlP app/assets/javascripts<CR>
map ,jl :CtrlP lib<CR>
map ,jm :CtrlP app/models<CR>
map ,jM :CtrlP app/mailers<CR>
map ,jp :CtrlP public<CR>
map ,js :CtrlP spec<CR>
map ,jS :CtrlP app/assets/stylesheets<CR>
map ,jv :CtrlP app/views<CR>
map ,jV :CtrlP vendor<CR>
