set nocompatible

packloadall
" pathogen is required to load bundles before vimrc is evaluated, vim8 pack
" gets loaded too late
exec pathogen#infect()
" Helptags
helptags ALL

" runtime! debian.vim
filetype plugin indent on
syntax on

if &termencoding == ""
  let &termencoding = &encoding
endif

setglobal fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,latin1
set completeopt+=preview

set background=light
set t_Co=256
colorscheme m

set exrc
set secure
set showcmd			" Show (partial) command in status line.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set hlsearch
set gdefault		" global subsitution by default
set mouse=a			" Enable mouse usage (all modes)
set sta
set noet
set sw=4
set ts=4
set hidden
set laststatus=2
set statusline=%1*\ %n\ %*\ %<%F\ %2*%m%*\ %2*%r%*%=%l/%L,%v\ [+%o]\ %2*%y%*
set nu
set backspace=indent,eol,start
set splitright
set splitbelow
set autoread
set notimeout
set ttimeout
set ttimeoutlen=10
set flp="\v^\s*(\*|\-|\d+[\]:.)}\t ])\s*" " Add ^\* and ^\- to flp
set fo+=jMn
set so=8            " keep space for 8 lines of context around cursor
set foldmethod=syntax
set fdls=99
set balloondelay=200
set ballooneval
set balloonevalterm

if has("unix")
	if has("osx")
		set rtp+=/usr/local/opt/fzf
	else
		set rtp+=~/.fzf
	endif
endif

let mapleader = ","

" expand one-line css blocks
nnoremap <leader>e :s/{ \?/{\r\t/<CR>:s/:\(\S\)/: \1/g<CR>:s/; \?/;\r\t/g<CR>:s/;\? *}$/;\r}/<CR>

" window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-\> :bp<bar>sp<bar>bn<bar>bd<CR>

" tab movement
nnoremap <leader>. :tabnext<CR>
nnoremap <leader>, :tabprev<CR>
nnoremap <leader>+ :tabnew<CR>
nnoremap <leader>\ :tabclose<CR>

" less stupid regex searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

nmap \\ :nohl<CR>

" lazy and accidents
nnoremap ; :
map! <F1> <ESC>

" find out where the cursor went on a big screen
fu! BlinkCursor()
	set cursorline
	redraw
	sleep 70m
	set nocursorline
	redraw
	sleep 70m
	set cursorline
	redraw
	sleep 70m
	set nocursorline
endfu

nnoremap <leader>c :call BlinkCursor()<CR>

" auto close brace
" inoremap {<CR> {<CR><BS>}<ESC>O

command W w !sudo tee > /dev/null %

" TODO: command that replaces # with number seq in selection or range
" TODO: command that expands single-line JSON-like objects (brackets and
" line enders), preserving indentation

au BufRead,BufNewFile Guardfile set ft=ruby
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 

" au BufWrite *.py :%YAPF
" au BufWritePre *.py call yapf#YAPFFile()
" au BufWritePre *.py call yapf#YAPF()

au Filetype html,gotplhtml setlocal ts=2 sts=2 sw=2   et
au FileType pgsql          setlocal ts=4 sts=4 sw=4   et
au FileType arduino        setlocal ts=4 sts=4 sw=4 noet cindent
au FileType nginx          setlocal ts=4 sts=4 sw=4 noet cindent
au FileType css            setlocal ts=2 sts=2 sw=2   et omnifunc=csscomplete#CompleteCSS
au FileType javascript     setlocal ts=4 sts=4 sw=4 noet omnifunc=javascriptcomplete#CompleteJS
au FileType gotplhtml      runtime! ftplugin/html.vim
au FileType matlab         setlocal commentstring=%\ %s

""" Plugin - Scratch """

nnoremap <leader>s :Sscratch<CR>

""" Plugin - EasyAlign """

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

""" Plugin - vim-go """

au FileType go nmap gi <Plug>(go-info)
au FileType go nmap gm <Plug>(go-implements)
au FileType go nmap gR <Plug>(go-rename)
au FileType go nmap gs <Plug>(go-def-split)
au FileType go nmap gb <Plug>(go-build)
au FileType go nmap gr <Plug>(go-run)
au FileType go nmap gl <Plug>(go-metalinter)
au FileType go nmap gt <Plug>(go-test)

let g:go_fmt_command         = "goimports"
let g:vim_tags_auto_generate = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods   = 1
let g:go_fmt_experimental    = 1
let g:go_list_type           = "quickfix"

""" Plugin - neocomplete """

let g:neocomplete#enable_at_startup = 0
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.go = '\([^.[:digit:] *\t]\.\w*>\)'

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

""" Plugin - fzf """

nnoremap <leader>v :vs <bar> FZF<CR>
nnoremap <leader>h :sp <bar> FZF<CR>
nnoremap <leader>f :FZF<cr>

""" Plugin - emmet """

let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

""" Plugin - syntastic """

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:syntastic_mode_map = { 'mode': 'active' }
let g:go_fmt_fail_silently = 1

let g:syntastic_go_staticcheck_exe = "staticcheck"
let g:syntastic_go_staticcheck_fname = ""

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_go_checkers = ['staticcheck']
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']

let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_cpp_checkers = ['']

""" Plugin - autoformat """

let g:formatdef_eslint = '"eslint-fmt"'
let g:formatters_javascript = ['eslint']
let g:formatters_go = []
let g:formatdef_tsfmt = '"tsfmt --stdin"'
let g:formatters_typescript = ['tsfmt']
let g:formatdef_yapf = '"yapf"'
let g:formatters_python = ['yapf']
let g:formatdef_swift = '"swiftformat --disable unusedArguments"'
let g:formatters_swift = ['swift']

au BufWrite *.js,*.ts,*.py,*.swift :Autoformat

""" Plugin - tsuquyomi """

" for syntastic integration
let g:tsuquyomi_disable_quickfix = 1

" omnicomplete show type signatures
let g:tsuquyomi_completion_detail = 1

hi def link typescriptIdentifier Special

""" Plugin - YCM """

" nnoremap <leader>yd :YcmCompleter GoTo<CR>
" let g:ycm_add_preview_to_completeopt = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1

""" Plugin - delimitMate """

let delimitMate_expand_cr = 2
let delimitMate_jump_expansions = 1

""" Plugin - asyncomplete """

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

call asyncomplete#register_source({
    \ 'name': 'gocode',
    \ 'whitelist': ['go'],
    \ 'completor': function('asyncomplete#sources#gocode#completor'),
	\ 'refresh_pattern': '[^.[:digit:] *\t]\(\.\w*\)$',
    \ })

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '~/.cache/cquery' },
      \ 'whitelist': ['c', 'cpp', 'cc', 'objc', 'objcpp'],
      \ })
endif

""" Plugin - ALE """

let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_sign_column_always = 1
let g:ale_set_balloons = 1
if has('osx')
	hi clear ALEErrorSign
	hi clear ALEWarningSign
	hi clear ALEInfoSign
	let g:ale_sign_error = '🚫'
	let g:ale_sign_warning = '⚠️'
	let g:ale_sign_info = 'ℹ️'
else
	let g:ale_sign_error = '!!'
	let g:ale_sign_warning = '!'
	let g:ale_sign_info = 'i'
endif
let g:ale_go_staticcheck_lint_package = 1
hi clear SignColumn

" func! BalloonExpr()
"     let s:balloon_timer = timer_start(0, 'RealBalloonExpr')
" 	return ''
" endfunc

" func! RealBalloonExpr(timer) abort
" 	let l:expr = ale#balloon#Expr()
" 	if (!empty(l:expr))
" 		call balloon_show(l:expr)
" 	endif
" endfunc

" set balloonexpr=BalloonExpr()

nnoremap <silent> <leader>n <plug>(ale_previous_wrap)
nnoremap <silent> <leader>p <plug>(ale_next_wrap)
