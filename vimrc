let mapleader = ',' " Sets the <Leader> key to a comma

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
"" OmniSharp
call minpac#add('OmniSharp/omnisharp-vim')
filetype indent plugin on
syntax enable

"" Blog extensions
call minpac#add('neoclide/coc.nvim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('machakann/vim-sandwich')
call minpac#add('preservim/nerdcommenter')
call minpac#add('tpope/vim-fugitive') " git extension
call minpac#add('airblade/vim-gitgutter') " git extension


"" NerdTree
call minpac#add('preservim/nerdtree')
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"" Vim Airline
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

"" Vim Test
call minpac#add('vim-test/vim-test')
let test#javascript#jasmine#executable = 'npx jasmine'

"" Grepper
call minpac#add('mhinz/vim-grepper')

let g:grepper = {}
let g:grepper.tools = ['grep', 'git', 'rg']

""" Search the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

""" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

"" Linting Plugins
call minpac#add('w0rp/ale')
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
call minpac#add('leafgarland/typescript-vim')
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
syntax on
set clipboard=unnamed " Copy to clipboard
colorscheme Monokai-Refined " Set color scheme
set smartcase " ignore case if search is all lower case
set ignorecase " ignore case when searching
set t_Co=256 " Allows for color schemes
set title
set number

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

