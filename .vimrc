" Basic config
syn on
set number
set encoding=utf-8
set nocompatible
filetype off

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
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'

" Extra bundles
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/emmet-vim'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'godlygeek/tabular'
Bundle 'airblade/vim-gitgutter'
Bundle 'sheerun/vim-polyglot'
Bundle 'w0ng/vim-hybrid'
Bundle 'paranoida/vim-airlineish'
Bundle 'grep.vim'
Bundle 'AutoComplPop'

" Grep config
map ff :Rgrep<CR>
au FileType qf nmap <buffer> <cr> <cr><c-w><c-p>
let Grep_Skip_Files = '*.bak *~ *tags *.log *.orig'
let Grep_Skip_Dirs = '.git'

" Emmet config
let g:user_emmet_expandabbr_key = '<c-e>'

" NERDTree config
noremap ,d :NERDTreeToggle<cr>
noremap ,f :NERDTreeFind<cr>

" Tabs
nnoremap tt :tabnew<cr>

" Splits
noremap ,v :vsp^<cr>
noremap ,h :split^<cr>

" Column marker
nnoremap cc :set cursorcolumn!<CR>

" CtrlP config
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Statusline config
set statusline=[%n]\ %<%f%m%r
set statusline+=\ %{exists('g:loaded_rvm')?rvm#statusline():''}
set statusline+=%{fugitive#statusline()}%=
set statusline+=%w\ <%{&fileformat}>%\=\ [%o]\ %l,%c%V\/%L\ \ %P

" Cursorline
set cursorline

" Scheme
colorscheme hybrid

" iTerm2 with hybrid onboard
let g:hybrid_use_iTerm_colors = 1

" Airline
set laststatus=2
let g:airline_theme = 'airlineish'
let g:airline_powerline_fonts = 1

" Syntax stuff
syntax enable
filetype plugin indent on

" Remaps
map § <Esc>

" GUI config
if has("gui_running")
  macmenu &File.New\ Tab key=<nop>
  set guifont=Monaco\ For\ Powerline:h11
  set guioptions=a
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set go-=L
end
