# vim-exec
A vim plugin that executes the current file.

# Installation
Install [pathogen](https://github.com/tpope/vim-pathogen), and then clone this repo into your `.vim/bundle` directory.
```
git clone https://github.com/SamTebbs33/vim-exec
```

# Usage

## Key mapping
The default key mapping is to `F12`, which can be changed by reassigning the `g:vim_exec_key` in your `.vimrc`.
```
" Map to <leader>e
let g:vim_exec_key = "<leader>e"
```

## Adding execution commands
Some common execution commands are provided by default (run `:call VimExecCmds()` to see a list of those), but more can be added easily.
The variable that stores the commands is called `g:vim_exec_cmds` and is a dictionary, where the key is the filetype and the value is the command to execute.
To create a new command or override an existing one:
```
let g:vim_exec_cmds["filetype"] = "cmd"
```
Where "filetype" is the filetype you want the command to apply to and "cmd" is the command itself. Use "%" ro reresent the path to the current file. Note that ":" is added to the beginning and "<CR>" is not needed at the end. Open a file of the filetype and press the key that is bound to VimExec to test the new command.

## Clearing the terminal
By default, VimExec will clear the terminal screen (not the vim buffer window) before executing a command. To disable this:
```
let g:vim_exec_clear = 0
```
To change the command used to clear the screen (It is `clear` by default):
```
let g:vim_clearcmd = "cls"
```
