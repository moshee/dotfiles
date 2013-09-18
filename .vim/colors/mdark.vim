" Vim color file
" Made By: moshee
"
set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "mdark"

hi Normal		cterm=NONE ctermfg=15 ctermbg=233
hi Visual		cterm=italic
hi LineNr		ctermfg=239

hi Comment		ctermfg=243

hi Constant		cterm=bold ctermfg=159
hi String		ctermfg=194
hi Character	ctermfg=82
hi Number		ctermfg=75
" Boolean = Constant
" Float = Number

hi Identifier	ctermfg=15
hi Function		ctermfg=121

hi Statement	cterm=bold ctermfg=75
hi Conditional	cterm=bold ctermfg=75
hi Repeat		cterm=bold ctermfg=75
hi Operator		cterm=bold ctermfg=75
" Label
" Keyword = Statement
" Exception = Statement

hi PreProc		cterm=bold ctermfg=15
" Include = PreProc
" Define = PreProc
" Macro = PreProc
" PreCondit = PreProc

hi Type			ctermfg=69
" StorageClass = Type
" Structure = Type
" Typedef = Type

hi Special		cterm=bold ctermfg=82
" SpecialChar = Special
hi Tag			ctermfg=33
" Delimiter = Special
hi SpecialComment cterm=italic ctermfg=15
" Debug = Special

hi Todo			cterm=italic,bold ctermfg=15
hi Error		cterm=bold ctermfg=lightgrey ctermbg=darkred

" vim:et:ff=unix:tw=0:ts=4:sw=4
" EOF m.vim
