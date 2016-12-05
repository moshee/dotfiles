set background=light

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "m"

hi Normal		cterm=none ctermfg=0
hi Visual		ctermbg=236 ctermfg=255
hi NonText		ctermfg=0
hi LineNr		term=italic ctermfg=246

hi Comment		ctermfg=244

hi Constant		cterm=bold ctermfg=0
hi String		ctermfg=240
hi Character	ctermfg=28
hi Number		ctermfg=18
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

hi Type			ctermfg=240
" StorageClass = Type
" Structure = Type
" Typedef = Type

hi Special		cterm=bold ctermfg=240
" SpecialChar = Special
hi Tag			ctermfg=18
" Delimiter = Special
" Debug = Special
hi Title        cterm=bold ctermfg=238

hi Todo			cterm=bold,underline ctermfg=0 ctermbg=white
hi Error		cterm=bold ctermfg=white ctermbg=darkred 
hi Folded       cterm=bold ctermfg=242 ctermbg=255

hi Pmenu		ctermbg=255 ctermfg=239

hi Cursor		cterm=none ctermbg=0 ctermfg=15
hi CursorLine	ctermbg=red ctermfg=white
hi StatusLine	cterm=bold ctermbg=254 ctermfg=238
hi StatusLineNC	cterm=none ctermbg=254 ctermfg=238
hi VertSplit	cterm=none ctermbg=254 ctermfg=252
hi User1		cterm=bold ctermbg=238 ctermfg=255
hi User2		cterm=bold ctermbg=254 ctermfg=0
hi User3		cterm=none ctermbg=254 ctermfg=241
