packadd minpac
call minpac#init()

" Plugins
call minpac#add('tpope/vim-unimpaired')
"call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')

"" Compiler Plugins
call minpac#add('leafgarland/typescript-vim')
let g:typescript_compiler_binary = 'npx tsc'

" Mappings
nnoremap <C-p> :<C-u>FZF<CR>

" Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

