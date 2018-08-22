setlocal ts=4 sw=4 noet makeprg=go\ build efm=%f:%l:\ %m

let b:ale_linters = ['go build', 'staticcheck']
let b:ale_linters_explicit = 1
