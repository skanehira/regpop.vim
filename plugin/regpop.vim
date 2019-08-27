" regpop
" Version: 0.0.1
" Author: skanehira
" License: MIT

if exists('g:loaded_regpop')
	finish
endif
"let g:loaded_regpop = 1

let s:save_cpo = &cpo
set cpo&vim

command! RegPop call regpop#registers()

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set et:


