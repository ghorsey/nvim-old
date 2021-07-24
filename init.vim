let g:ale_disable_lsp=1 " Disable ALE LISP server
let mapleader = ',' " Sets the <Leader> key to a comma

" Setup Package Manager
packadd minpac
call minpac#init()

" Plugins
call minpac#add('puremourning/vimspector')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-projectionist')
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('nvim-telescope/telescope.nvim')
call minpac#add('nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' })
call minpac#add('nvim-lua/popup.nvim') " telescope dependency
call minpac#add('nvim-lua/plenary.nvim') " telescope dependency
"call minpac#add('junegunn/fzf', {'do': {-> fzf#install() }})
"call minpac#add('junegunn/fzf.vim')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('ryanoasis/vim-devicons')
call minpac#add('OmniSharp/omnisharp-vim')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('vim-airline/vim-airline') " The fancy status bar
call minpac#add('vim-airline/vim-airline-themes') " The fancy status bar themes
call minpac#add('preservim/nerdtree')
call minpac#add('vim-test/vim-test')
call minpac#add('neoclide/coc.nvim') " add LSP support
call minpac#add('jiangmiao/auto-pairs') " automaticall close pairs, (), {}, etc
call minpac#add('machakann/vim-sandwich') " surround objects
call minpac#add('preservim/nerdcommenter') " Commenter
call minpac#add('tpope/vim-fugitive') " git extension
call minpac#add('airblade/vim-gitgutter') " git extension
call minpac#add('w0rp/ale') " Adds static syntax
call minpac#add('arcticicestudio/nord-vim') " Colorscheme
call minpac#add('rbgrouleff/bclose.vim') " Adds <leader>bd to close/delete a buffer

function! ImportConfig(file)
  exec printf('source %s', fnamemodify(expand('$MYVIMRC'), ':h') . expand('/') . a:file)
endfunction

"" OmniSharp
call ImportConfig('omnisharp.vim')

"" Coc
call ImportConfig('coc.vim')

"" NertTree
call ImportConfig('nerdtree.vim')

"" LUA configuarions
lua require('gah.telescope')

""" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" resize current buffer by +/- 5
nnoremap <C-left> :vertical resize -1<CR>
nnoremap <C-Down> :resize +1<CR>
nnoremap <C-Up> :resize -1<CR>
nnoremap <C-Right> :vertical resize +1<CR>

"" Vim Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'

"" Vim Test
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

" Vimspector settings
"" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval

let g:vimspector_install_gadgets = ['netcoredbg']

"" Linting Plugins
let g:ale_linters = {
\  'cs': ['OmniSharp'],
\  'javascript': ['eslint'],
\  'scss': ['scsslint'],
\  'typescript': ['tsserver'],
\  'markdown': ['markdownlint', 'writegood']
\}

let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_sign_column_always = 1 " Always show the ale gutter
let g:airline#extensions#ale#enabled = 1

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
" This directory should exist.
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

"" Terminal mappings
if has('nvim')
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
  tnoremap <C-v><Esc> <Esc>

  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Options

autocmd FileType markdown let g:indentLine_enabled=0
autocmd FileType markdown set conceallevel=0 " Do not hide characters

set guifont=FiraCode\ NF:h11
set noswapfile
set mouse=a " Enable Mouse Support
set clipboard=unnamed " Copy to clipboard
set smartcase " ignore case if search is all lower case
set ignorecase " ignore case when searching
set title
set number
syntax enable
colorscheme nord " Set color scheme

" Set correct colors
if (has("termguicolors"))
  set termguicolors
endif


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

silent! helptags ALL " Generate helptags

" Commands
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

