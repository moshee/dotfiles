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

" less stupid regex searching
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" lazy and accidents
nnoremap ; :
map! <F1> <ESC>

au BufRead,BufNewFile Guardfile set ft=ruby
au BufWrite *.go  Fmt

au Filetype html,gotplhtml  setlocal ts=2 sts=2 sw=2 et
au FileType pgsql setlocal ts=4 sw=4 et

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.go = '[^.[:digit:] *\t]\%(\.\)'

" auto close brace
inoremap {     {}<LEFT>
inoremap {<CR> {<CR><BS>}<ESC>O
inoremap {{    {
inoremap {}    {}
