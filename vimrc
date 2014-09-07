:execute pathogen#infect()
:set number
:fixdel
:autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
:autocmd vimenter * if !argc() | NERDTree | endif
:set term=xterm
:set t_Co=256
:let &t_AB="\e[48;5;%dm"
:let &t_AF="\e[38;5;%dm"
:colorscheme Monokai-Refined
:set smartcase
:set ignorecase
:set shiftwidth=4
:set softtabstop=4
:nnoremap <silent> [b :bprevious<CR>
:nnoremap <silent> ]b :bnext<CR>
:nnoremap <silent> [B :bfirst<CR>
:nnoremap <silent> ]B :blast<CR>
