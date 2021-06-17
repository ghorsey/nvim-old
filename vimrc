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
"let g:OmniSharp_popup_mappings.close = '<Esc>'

let g:OmniSharp_popup_options = {
\ 'highlight': 'Normal',
\ 'padding': [1],
\ 'border': [1]
\}

let g:OmniSharp_popup_options = {
\ 'winblend': 30,
\ 'winhl': 'Normal:Normal'
\}

" Don't autoselect first omnicomplete option, show options even if there is only
" one (so the preview documentation is accessible). Remove 'preview', 'popup'
" and 'popuphidden' if you don't want to see any documentation whatsoever.
" Note that neovim does not support `popuphidden` or `popup` yet:
" https://github.com/neovim/neovim/issues/10996
if has('patch-8.1.1880')
  set completeopt=longest,menuone,popuphidden
  " Highlight the completion documentation popup background/foreground the same as
  " the completion menu itself, for better readability with highlighted
  " documentation.
  set completepopup=highlight:Pmenu,border:off
else
  set completeopt=longest,menuone,preview
  " Set desired preview window height for viewing documentation.
  set previewheight=5
endif

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
  " Repeat the last code action performed (does not use a selector)
  autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
  autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

  autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END

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
"nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
"nnoremap <C-f> :NERDTreeFind<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

"" Vim Airline
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

"" Vim Test
call minpac#add('vim-test/vim-test')
"let g:test#runner_commands = ['Jasmine']
"let g:test#enabled_runners = ['javascript#jasmine']
"let g:test#javascript#jasmine#file_pattern = '\v^spec/.spec\.(js|jsx|coffee)$'
let g:test#javascript#jasmine#file_pattern = '\v^spec[\\/].*spec\.(js|jsx|coffee)$'
if has('nvim')
  let test#strategy='neovim'
else
  let test#strategy='vimterminal'
endif

"let test#javascript#runner = 'jasmine'
let test#javascript#jasmine#executable = 'npx jasmine'

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

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

