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
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

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
\  'javascript': ['eslint'],
\}

""" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

"" Mapping window movements
nnoremap <M-h> <c-w>h
nnoremap <M-j> <c-w>j
nnoremap <M-k> <c-w>k
nnoremap <M-l> <c-w>l

if has('nvim')
  tnoremap <M-h> <c-\><c-n><c-w>h
  tnoremap <M-j> <c-\><c-n><c-w>j
  tnoremap <M-k> <c-\><c-n><c-w>k
  tnoremap <M-l> <c-\><c-n><c-w>l
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

" options
:syntax on
:set clipboard=unnamed

" Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

