" Base
set number
set encoding=utf-8
set clipboard=unnamed

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
set nocompatible
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
Plugin 'w0ng/vim-hybrid'
Plugin 'sheerun/vim-polyglot'
Plugin 'bling/vim-airline'
Plugin 'paranoida/vim-airlineish'

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
let g:airline_theme='airlineish'

" Colorscheme
let g:hybrid_use_iTerm_colors=1
colorscheme hybrid

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

" GUI config
if has("gui_running")
  macmenu &File.New\ Tab key=<nop>
  set guifont=Menlo\ For\ Powerline:h12
  set guioptions=A
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set go-=L
end
