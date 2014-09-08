:set nocompatible 
:filetype plugin on
:runtime macros/matchit.vim

:execute pathogen#infect()
:execute pathogen#helptags()
:set number
:set hidden " hide a buffer instead of closing it
:set nowrap " do not wrap long lines
:set backspace=indent,eol,start " bs over evrything
:set autoindent " enable auto indent
:set copyindent " copy the previous indentation on autoindenting
:set smartcase " ignore case if search is all lower case
:set smarttab " insert tabs on start of line according to shiftwidth
:set ignorecase " ignore case when searching
:set showmatch " show matching paren
:set shiftwidth=4
:set shiftround " use multiple shipwidth when indenting with '<' and '>'
:set softtabstop=4
:set hlsearch " hilight matches
:set incsearch " show matches as you type
:set term=xterm
:set t_Co=256
:set history=1000 " much history
:set undolevels=1000 " much undo
:set wildignore=*.swp,*.bak,*.pyc,*.class
:set title " change the terminal title
:set visualbell " do not beep
:set noerrorbells
:set nobackup
:set noswapfile
:set mouse=a
:fixdel
:let &t_AB="\e[48;5;%dm"
:let &t_AF="\e[38;5;%dm"
:colorscheme Monokai-Refined
:nnoremap <silent> [b :bprevious<CR>
:nnoremap <silent> ]b :bnext<CR>
:nnoremap <silent> [B :bfirst<CR>
:nnoremap <silent> ]B :blast<CR>
:cnoremap <C-p> <Up>
:cnoremap <C-n> <Down>
:map <C-h> <C-w>h
:map <C-j> <C-w>j
:map <C-k> <C-w>k
:map <C-l> <C-w>l

" set the path to the directory used to open VIM and all sub directories
:set path=$PWD/**

" make %% a shortcurt for printing out the path of the file loaded in the
" current buffer
:cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' 
