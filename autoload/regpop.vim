" regpop
" Version: 0.0.1
" Author: skanehira
" License: MIT
let s:save_cpo = &cpo
set cpo&vim

let s:registers = [
			\ '0',
			\ '1',
			\ '2',
			\ '3',
			\ '4',
			\ '5',
			\ '6',
			\ '7',
			\ '8',
			\ '9',
			\ 'a',
			\ 'b',
			\ 'c',
			\ 'd',
			\ 'e',
			\ 'g',
			\ 'h',
			\ 'i',
			\ 'j',
			\ 'k',
			\ 'n',
			\ 'p',
			\ 'q',
			\ 'r',
			\ 's',
			\ 'v',
			\ 'w',
			\ 'x',
			\ 'y',
			\ 'z',
			\ '-',
			\ '*',
			\ '.',
			\ ':',
			\ '%',
			\ '#',
			\ '/',
			\ '='
			\ ]

function! s:get_reg(registers, id, idx) abort
	let reg = s:registers[a:idx-1]
	exec "normal i"
endfunction

function! regpop#registers() abort
	let curpos = getpos('.')
	let registers = s:get_registers()
	call popup_menu(map(copy(s:registers), 'v:val .. "\t" .. registers[v:val][:20] .. "..."'), {
				\ 'filter': 'popup_filter_menu',
				\ 'callback': function('s:get_reg', [registers]),
				\ 'maxwidth': 30,
				\ 'maxheight': 30
				\ })
	call setpos('.', curpos)
endfunction

function! s:get_registers() abort
	let reg = {}
	for name in s:registers
		let reg[name] = getreg(name)
	endfor
	return reg
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo

