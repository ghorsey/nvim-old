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

"" Compiler Plugins
call minpac#add('leafgarland/typescript-vim')
let g:typescript_compiler_binary = 'npx tsc'

" Mappings
"" Ctrl-P to open fuzzy search
nnoremap <C-p> :<C-u>FZF<CR>

"" Grepper tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>


" Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

