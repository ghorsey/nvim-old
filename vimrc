packadd minpac
call minpac#init()

" Plugins
call minpac#add('tpope/vim-unimpaired')
"call minpac#add('tpope/vim-scriptease', { 'type': 'opt' })
call minpac#add('k-takata/minpac', { 'type': 'opt' })
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-projectionist')

" Mappings
nnoremap <C-p> :<C-u>FZF<CR>

" Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

