" Base
set ttyfast
set encoding=utf-8
set clipboard=unnamed
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile
set gcr=a:blinkon0 " no cursor blinking
set visualbell
set noerrorbells
set showmatch
set number
set cursorline
nnoremap ; :
set title

" Scrolling
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Better ESC key
imap jk <ESC>
noremap! <F1> <ESC>

" Whitespace config
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set list
set listchars=trail:.
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace
set autoindent
set copyindent
set smartindent
set smarttab
set nowrap

" Search config
set incsearch
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig
set wildignore+=*.DS_Store,*/.sass-cache/,*/.vagrant/,*/tmp/*,*.pdf,*/node_modules/*,*/dist/*,*/bower_components/*

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor\ --ignore=tmp\ --ignore=public/assets\ --ignore=lib/checkout/coverage
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Rulers
set ruler
set colorcolumn=120

" NeoBundle
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bling/vim-airline'
NeoBundle 'bogado/file-line'
NeoBundle 'ervandew/supertab'
NeoBundle 'godlygeek/tabular'
NeoBundle 'grep.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'lukaszklis/badwolf'
NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

syntax on
filetype plugin indent on

" Bundles config

"" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Additional mapping for buffer search
nnoremap <silent> ,b :CtrlPBuffer<cr>
nnoremap <silent> <C-b> :CtrlPBuffer<cr>

" Idea from : http://www.charlietanksley.net/blog/blog/2011/10/18/vim-navigation-with-lustyexplorer-and-lustyjuggler/
" Open CtrlP starting from a particular path, making it much
" more likely to find the correct thing first. mnemonic 'jump to [something]'
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

" The top results seems to be better. Also, we want more results, so lets go
" with 30
let g:ctrlp_match_window='order:ttb,max:20'

if executable('ag')
  " Use ag (the Silver Searcher) in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"" grep config
map ff :Rgrep<CR>
au FileType qf nmap <buffer> <cr> <cr><c-w><c-p>
let Grep_Skip_Files = '*.bak *~ *tags *.log *.orig'
let Grep_Skip_Dirs = '.git .svn .hg .tmp .sass-cache'

"" Emmet config
let g:user_emmet_expandabbr_key = '<c-e>'

"" Airline config
set statusline=[%n]\ %<%f%m%r
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%{fugitive#statusline()}%=
set statusline+=%w\ <%{&fileformat}>%\=\ [%o]\ %l,%c%V\/%L\ \ %P
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

"" Gist config
let g:gist_clip_command='pbcopy'
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
let g:gist_show_privates=1

"" vim-fugitive config
nmap ,gs :Gstatus<cr>
nmap ,gd :Gdiff<cr>
nmap ,gb :Gblame<cr>

"" Autoclose
let g:AutoClosePairs={'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

"" Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_echo_current_error=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0

" Colorscheme
let g:badwolf_darkgutter=1
let g:badwolf_css_props_highlight=1
colorscheme badwolf

" NERDTree config
noremap ,f :NERDTreeFind<cr>
noremap ,d :NERDTreeToggle<cr>

" Tabs
noremap tt :tabnew<cr>
noremap tp :tabp<cr>
noremap tn :tabn<cr>

" Highlightning
set hlsearch
noremap ,c :nohl<cr>

" Splits
noremap ,v :vsp^<cr>
noremap ,h :split^<cr>
nmap <silent> <Up> :wincmd k<CR>
nmap <silent> <Down> :wincmd j<CR>
nmap <silent> <Left> :wincmd h<CR>
nmap <silent> <Right> :wincmd l<CR>

" Column marker
nnoremap cc :set cursorcolumn!<CR>

" Git config
vmap <Leader>gb :Gblame<cr>

" GUI config
if has("gui_running")
  macmenu &File.New\ Tab key=<nop>
  set guifont=Monaco\ For\ Powerline:h12
  set guioptions=A
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set go-=L
  set mouse=v
end

NeoBundleCheck
