if exists("g:vim_exec_loaded")
	finish
endif

if !exists("g:vim_exec_key")
	let g:vim_exec_key = "<F12>"
endif

if !exists("g:vim_exec_clearcmd")
	let g:vim_exec_clearcmd = "clear"
endif

if !exists("g:vim_exec_clear")
	let g:vim_exec_clear = 0
endif

let g:vim_exec_loaded = 1

let g:vim_exec_cmds = {"python" : "!python %", "ocaml" : "!ocaml < %", "vim" : "source %"}

function! VimExecDo()
	if has_key(g:vim_exec_cmds, &ft)
		execute ":w!"
		if g:vim_exec_clear
			execute "silent " . "!" . g:vim_exec_clearcmd
		endif
		execute g:vim_exec_cmds[&ft]
	else
		echom "No mapping found for filetype: " . &ft
	endif
endfunction

execute "nnoremap" g:vim_exec_key ":call VimExecDo()<CR>"
