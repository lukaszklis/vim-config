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
set colorcolumn=120

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
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'edkolev/tmuxline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'Townk/vim-autoclose'
Plugin 'grep.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'

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

" Tmuxline
let g:tmuxline_powerline_separators=0

" Colorscheme
colorscheme solarized

" Emmet
let g:user_emmet_expandabbr_key='<c-e>'

" Multiple cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-n>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Airline config
set statusline=[%n]\ %<%f%m%r
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%{fugitive#statusline()}%=
set statusline+=%w\ <%{&fileformat}>%\=\ [%o]\ %l,%c%V\/%L\ \ %P
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

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
map ,s :Rgrep<CR>
nmap ,gs :Gstatus<cr>
nmap ,gd :Gdiff<cr>
nmap ,gb :Gblame<cr>
map H ^
map L $
noremap ,f :NERDTreeFind<cr>
noremap ,d :NERDTreeToggle<cr>

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

" grep.vim
au FileType qf nmap <buffer> <cr> <cr><c-w><c-p>
let Grep_Skip_Files = '*.bak *~ *tags *.log *.orig'
let Grep_Skip_Dirs = '.git .svn .hg .tmp .sass-cache bower_components node_modules'

" Autoclose
let g:AutoClosePairs={'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Rainbow
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" MacVim setup
if has("gui_macvim")
  set guifont=Monaco\ For\ Powerline:h12
  set guioptions=A
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set go-=L
end
