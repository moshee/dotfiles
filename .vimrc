runtime bundle/vim-pathogen/autoload/pathogen.vim
runtime! debian.vim

filetype plugin indent on
syntax on

exec pathogen#infect()

if &termencoding == ""
  let &termencoding = &encoding
endif
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8,latin1
set completeopt-=preview

set background=light
colorscheme m
set t_Co=256

set showcmd			" Show (partial) command in status line.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set gdefault		" global subsitution by default
set mouse=a			" Enable mouse usage (all modes)
set noexpandtab		" no spaces pls
set sw=4
set ts=4
set hidden
set laststatus=2
set statusline=(%n)\ %<%F\ %m\ %r\ %=%l/%L,%v\ %y
set nu
set backspace=indent,eol,start

" http://superuser.com/questions/99138/bulleted-lists-for-plain-text-documents-in-vim
 let &formatlistpat='\v^\s*(\d+[\]:.)}\t ]|[\*\-][\t ])\s*'

let mapleader = ","
let g:user_emmet_expandabbr_key = '<c-e>'
let g:use_emmet_complete_tag = 1

" expand one-line css blocks
nnoremap <leader>e :s/{ \?/{\r\t/<CR>:s/:\(\S\)/: \1/g<CR>:s/; \?/;\r\t/g<CR>:s/;\? *}$/;\r}/<CR>

nnoremap <leader>t i<TAB><ESC>
nnoremap <leader>d ddpk

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

" http://stackoverflow.com/questions/14727173/swap-items-in-comma-separated-list
nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>
nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>

" less stupid regex searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" lazy and accidents
nnoremap ; :
map! <F1> <ESC>

nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)

" auto close brace
inoremap {<CR> {<CR><BS>}<ESC>O

command W w !sudo tee > /dev/null %

let g:gofmt_command = "goimports"
let g:vim_tags_auto_generate = 1

let g:neocomplete#enable_at_startup = 1
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
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\%(\.\)'

au BufRead,BufNewFile Guardfile set ft=ruby
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 
au BufWrite           *.go GoImports

au Filetype html,gotplhtml,gohtmltmpl setlocal ts=2 sts=2 sw=2 et
au FileType pgsql                     setlocal ts=4 sw=4  et
au FileType arduino                   setlocal ts=4 sw=4  noet cindent
au FileType nginx                     setlocal ts=4 sw=4  noet cindent
au FileType css                       setlocal omnifunc=csscomplete#CompleteCSS
au FileType javascript                setlocal omnifunc=javascriptcomplete#CompleteJS


