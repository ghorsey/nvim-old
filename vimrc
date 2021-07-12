let mapleader = ',' " Sets the <Leader> key to a comma
let g:ale_disable_lsp=1 " Disable ALE LISP server

" Setup Package Manager
packadd minpac
call minpac#init()

" Plugins
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-obsession')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('Yggdroot/indentLine')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('mhinz/vim-grepper')
call minpac#add('OmniSharp/omnisharp-vim')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('preservim/nerdtree')
call minpac#add('vim-test/vim-test')
call minpac#add('neoclide/coc.nvim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('machakann/vim-sandwich')
call minpac#add('preservim/nerdcommenter')
call minpac#add('tpope/vim-fugitive') " git extension
call minpac#add('airblade/vim-gitgutter') " git extension
call minpac#add('w0rp/ale')

"" OmniSharp
source ./omnisharp.vim

"" Coc
source ./coc.vim

" resize current buffer by +/- 5
nnoremap <C-left> :vertical resize -1<cr>
nnoremap <C-Down> :resize +1<cr>
nnoremap <C-Up> :resize -1<cr>
nnoremap <C-Right> :vertical resize +1<cr>

"" NerdTree
nnoremap <leader>n :NERDTreeFocus<CR>
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
"autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

"" Vim Test
"let g:test#javascript#jasmine#file_pattern = '\v^spec[\\/].*spec\.(js|jsx|coffee)$'
"let test#javascript#jasmine#executable = 'npx jasmine'

if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif


" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

"" Grepper

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

""" Search the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

""" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

"" Linting Plugins
let g:ale_linters = {
\  'cs': ['OmniSharp'],
\  'javascript': ['eslint'],
\}


""" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"" Mapping window movements
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr())
    if (match(a:key, '[jk]'))
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

nnoremap <M-h> :call WinMove('h')<CR>
nnoremap <M-j> :call WinMove('j')<CR>
nnoremap <M-k> :call WinMove('k')<CR>
nnoremap <M-l> :call WinMove('l')<CR>

if has('nvim')
  tnoremap <M-h> <c-\><c-n> :call WinMove('h')<CR>
  tnoremap <M-j> <c-\><c-n> :call WinMove('j')<CR>
  tnoremap <M-k> <c-\><c-n> :call WinMove('k')<CR>
  tnoremap <M-l> <c-\><c-n> :call WinMove('l')<CR>
endif

"" Compiler Plugins
let g:typescript_compiler_binary = 'npx tsc'

" Mappings
"" Ctrl-P to open fuzzy search
nnoremap <C-p> :<C-u>FZF<CR>

"" Grepper tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>

"" Terminal mappings
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>

  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Options
" set guifont=FiraCode\ Nerd\ Font\ Mono:h11
set noswapfile
set mouse=a " Enable Mouse Support
set clipboard=unnamed " Copy to clipboard
set smartcase " ignore case if search is all lower case
set ignorecase " ignore case when searching
set title
set number
syntax enable
colorscheme Monokai-Refined " Set color scheme

"" Undo file
set undofile
if !has('nvim')
  set undodir=$VIMDATA/undo
  :call mkdir(&undodir, 'p')
endif

augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofule " Do not create undo file for temp files
augroup END

" Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

