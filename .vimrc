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
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,*.zip,*.gz,*.bz,*.tar,*.jpg,*.png,*.gif,*.avi,*.wmv,*.ogg,*.mp3,*.mov,*.DS_Store,*.orig,.sass-cache/,.vagrant/,*/tmp/*,*.pdf,node_modules/*,dist/*

" Rulers
set ruler

" Vundle config
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'gmarik/vundle'

" Extra bundles
Bundle 'sjl/badwolf'
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

set cursorline
colorscheme badwolf
syntax enable
filetype plugin indent on

if has("gui_running")
  macmenu &File.New\ Tab key=<nop>
  set guifont=Menlo:h12
  set guioptions-=r
  set guioptions-=R
  set guioptions-=l
  set go-=L
end
