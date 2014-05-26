" Base
set nocompatible
set ttyfast
set number
set encoding=utf-8
set clipboard=unnamed
set backspace=indent,eol,start

" Better ESC key
imap jk <ESC>

" Whitespace config
set tabstop=2
set shiftwidth=2
set expandtab
set list
set listchars=trail:.
autocmd BufWritePre * :%s/\s\+$//e " strip trailing whitespace
set autoindent
set nowrap

" Search config
set ignorecase
set smartcase
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.orig
set wildignore+=*.DS_Store,*/.sass-cache/,*/.vagrant/,*/tmp/*,*.pdf,*/node_modules/*,*/dist/*,*/bower_components/*

" Rulers
set ruler
set colorcolumn=120

" Vundle config
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" Bundles
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'grep.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-commentary'
Plugin 'ervandew/supertab'
Plugin 'mattn/emmet-vim'
Plugin 'sjl/badwolf'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/syntastic'
Plugin 'mattn/gist-vim'
Plugin 'tpope/vim-surround'
Plugin 'Townk/vim-autoclose'

" Bundles config

"" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim

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

"" Syntastic config
let g:syntastic_check_on_open=0
let g:syntastic_echo_current_error=0
let g:syntastic_auto_jump=0
let g:syntastic_auto_loc_list=0

"" Gist config
let g:gist_clip_command='pbcopy'
let g:gist_detect_filetype=1
let g:gist_open_browser_after_post=1
let g:gist_show_privates=1

" Autoclose
let g:AutoClosePairs={'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" Colorscheme
colorscheme badwolf
let g:badwolf_darkgutter=1
let g:badwolf_css_props_highlight=1

" netrw config
let g:netrw_banner=0
let g:netrw_keepdir=0
let g:netrw_liststyle=3
noremap ,f :Explore<cr>
noremap ,d :Explore!<cr>

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

" Column marker
nnoremap cc :set cursorcolumn!<CR>

" Syntax highlightning
syntax enable

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
