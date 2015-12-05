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

if !exists("g:vim_exec_vimux")
	let g:vim_exec_vimux = 0
endif

let g:vim_exec_loaded = 1

let g:vim_exec_cmds = {
\	"python" : ["!python %"],
\	"ocaml" : ["!ocaml < %"],
\	"vim" : ["source %"],
\	"javascript" : ["!node %"],
\	"html" : ["!open %"], 
\	"sh" : ["!sh %"],
\	"haskell" : ["!ghci < %"],
\	"java" : ["!javac %", "!java %:r"]
\ }

function! VimExecDo()
	if has_key(g:vim_exec_cmds, &ft)
		execute ":w!"
		if g:vim_exec_vimux
			if g:vim_exec_clear
				execute ":VimuxRunCommand(\"" . g:vim_exec_clearcmd . "\")"
			endif
			for cmd in g:vim_exec_cmds[&ft]
				if cmd =~ "^!"
					let cmd = cmd[1:]
				endif
				let cmd = substitute(cmd, "%:r", @%:r, "")
				execute ":VimuxRunCommand(\"" . substitute(cmd, "%", @%, "") . "\")"
			endfor
		else
			if g:vim_exec_clear
				execute "silent " . "!" . g:vim_exec_clearcmd
			endif
			for cmd in g:vim_exec_cmds[&ft]
				execute cmd
			endfor
		endif
	else
		echom "No mapping found for filetype: " . &ft
	endif
endfunction

function! VimExecCmds()
	for a in items(g:vim_exec_cmds)
		echo a[0] . " : " . a[1]
	endfor
endfunction

execute "nnoremap" g:vim_exec_key ":call VimExecDo()<CR>"
