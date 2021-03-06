" Vim color file
" Made By: moshee
"
set background=light

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "mm"

hi Normal		cterm=NONE ctermfg=0 
hi Visual		cterm=italic
hi NonText		ctermfg=0 
hi LineNr		term=italic ctermfg=246 

hi Comment		ctermfg=244 

hi Constant		cterm=bold ctermfg=0 
hi String		ctermfg=28 
hi Character	ctermfg=34 
hi Number		ctermfg=20 
" Boolean = Constant
hi Float		ctermfg=18 

hi Identifier	ctermfg=0 
hi Function		ctermfg=23 

hi Statement	cterm=bold ctermfg=0 
hi Conditional	cterm=bold ctermfg=0 
hi Repeat		cterm=bold ctermfg=0 
hi Label		cterm=underline ctermfg=0 
hi Operator		cterm=bold ctermfg=0 
" Keyword = Statement
" Exception = Statement

hi PreProc		cterm=bold ctermfg=0 
" Include = PreProc
" Define = PreProc
" Macro = PreProc
" PreCondit = PreProc

hi Type			ctermfg=19
" StorageClass = Type
" Structure = Type
" Typedef = Type

hi Special		ctermfg=28 
" SpecialChar = Special
hi Tag			ctermfg=18 ctermbg=7
" Delimiter = Special
hi SpecialComment cterm=italic ctermfg=0 
" Debug = Special

hi Todo			cterm=italic,bold ctermfg=0 ctermbg=255 
hi Error		cterm=bold ctermfg=lightgrey ctermbg=darkred 

" vim:et:ff=unix:tw=0:ts=4:sw=4
" EOF m.vim
