" Basic config
syn on
set number
set encoding=utf-8
set laststatus=2
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
Bundle 'chrismetcalf/vim-autocomplpop'
Bundle 'airblade/vim-gitgutter'
Bundle 'mileszs/ack.vim'
Bundle 'sheerun/vim-polyglot'
Bundle 'w0ng/vim-hybrid'
Bundle 'paranoida/vim-airlineish'

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

" Cursorline
set cursorline

" Scheme
colorscheme hybrid

" iTerm2 with hybrid onboard
let g:hybrid_use_iTerm_colors = 1

" Airline
let g:airline_theme = 'airlineish'
let g:airline_powerline_fonts = 1

" Syntax stuff
syntax enable
filetype plugin indent on

" GUI config
if has("gui_running")
  macmenu &File.New\ Tab key=<nop>
  set guifont=Monaco\ For\ Powerline:h11
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set go-=L
end
