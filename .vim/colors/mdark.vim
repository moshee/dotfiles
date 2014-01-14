" Vim color file
" Made By: moshee
"
set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "mdark"

hi Normal		cterm=NONE ctermfg=254 ctermbg=233
hi Visual		cterm=italic
hi LineNr		ctermfg=239

hi Comment		ctermfg=243

hi Constant		cterm=bold,underline
hi String		ctermfg=179
hi Character	ctermfg=119
hi Number		ctermfg=221
" Boolean = Constant
" Float = Number

hi Identifier	ctermfg=15
hi Function		ctermfg=121

hi Statement	cterm=bold ctermfg=15
hi Conditional	cterm=bold ctermfg=15
hi Repeat		cterm=bold ctermfg=15
hi Operator		cterm=bold ctermfg=230
" Label
" Keyword = Statement
" Exception = Statement

hi PreProc		cterm=bold ctermfg=247
" Include = PreProc
" Define = PreProc
" Macro = PreProc
" PreCondit = PreProc

hi Type			ctermfg=186
" StorageClass = Type
" Structure = Type
" Typedef = Type

hi Special		cterm=bold ctermfg=195
" SpecialChar = Special
hi Tag			ctermfg=33
" Delimiter = Special
" Debug = Special

hi Todo			cterm=bold,underline ctermfg=15 ctermbg=233
hi Error		cterm=bold ctermfg=15 ctermbg=darkred

" vim:et:ff=unix:tw=0:ts=4:sw=4
" EOF m.vim
