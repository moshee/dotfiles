runtime! debian.vim

syntax on
set background=light
colorscheme m
filetype plugin indent on
filetype plugin on

if &termencoding == ""
  let &termencoding = &encoding
endif
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8,latin1

set showcmd			" Show (partial) command in status line.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set gdefault		" global subsitution by default
set mouse=a			" Enable mouse usage (all modes)
set noexpandtab		" no spaces pls
set shiftwidth=4
set tabstop=4
set hidden
set laststatus=2
set statusline=(%n)\ %<%F\ %m\ %r\ %=%l/%L,%v\ %y
set nu
set backspace=indent,eol,start

if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

let mapleader = ","

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

" less stupid regex searching
nnoremap / /\v
vnoremap / /\v

nnoremap ; :
map! <F1> <ESC>

" autocmds
au Filetype           html  setlocal ts=2 sts=2 sw=2 et
au FileType           ruby  setlocal ts=2 sts=2 sw=2 et
au FileType           go    setlocal ts=4 sw=4 noet
au BufWrite           *.go  Fmt
au BufRead,BufNewFile *.sql setf pgsql
au FileType           pgsql setlocal ts=4 sw=4 et

func! MinCss()
  %s/\v[\t\r\n]//
  %s/\v ?([{}:;,]) ?/\1/
  %s/;}/}/
endfunc
