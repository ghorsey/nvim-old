:execute pathogen#infect()
:set number
:fixdel
:autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd vimenter * if !argc() | NERDTree | endif
