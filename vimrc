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
:set expandtab
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
:set background=dark
:set clipboard=unamed
:fixdel
:syntax enable
:let &t_AB="\e[48;5;%dm"
:let &t_AF="\e[38;5;%dm"
:let g:bluedrake_256=1
:colorscheme bluedrake
":colorscheme flattr
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

if has("multi_byte")
    if &termencoding == ""
        let &termencoding = &encoding
    endif
    set encoding=utf-8
    setglobal fileencoding=utf-8
    "setglobal bomb
    set fileencodings=ucs-bom,utf-8,latin1
endif

:set path+=.\**,$PWD\**
" make %% a shortcurt for printing out the path of the file loaded in the
" current buffer
:cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%' 

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:»\ ,eol:¬
