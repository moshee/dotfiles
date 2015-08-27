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

au BufRead,BufNewFile Guardfile set ft=ruby
au BufWrite *.go  GoImports

au Filetype html,gotplhtml,gohtmltmpl  setlocal ts=2 sts=2 sw=2 et
au FileType pgsql setlocal ts=4 sw=4 et

" auto close brace
inoremap {<CR> {<CR><BS>}<ESC>O

command W w !sudo tee > /dev/null %

au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif 
au FileType nginx setlocal ts=4 sw=4 noet cindent

let g:gofmt_command = "goimports"
