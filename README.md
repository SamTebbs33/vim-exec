# vim-exec
A vim plugin that executes the current file.

![](http://zippy.gfycat.com/MindlessExcellentAfricangroundhornbill.gif)

# Installation
Install [pathogen](https://github.com/tpope/vim-pathogen), and then clone this repo into your `.vim/bundle` directory.
```
cd ~/.vim/bundle && git clone https://github.com/SamTebbs33/vim-exec
```

# Usage

## Key mapping
The default key mapping is to `F12`, which can be changed by reassigning `g:vim_exec_key` in your `.vimrc`.
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

If you'd like to add a command that will be supplied by default, fork the repo, edit the `plugin/vim-exec.vim` file and add the filetype and command to the end of the `g:vim_exec_cmds` dictionary.
```
let g:vim_exec_cmds = {..., "new-filetype" : "new-comand"}
```
Then open a pull request. I will merge the pull request if the change is relevant and doesn't do anything malicious to the user's system (i.e, no "rm -rf /*")

## Clearing the terminal
By default, VimExec will clear the terminal screen (not the vim buffer window) before executing a command. To disable this:
```
let g:vim_exec_clear = 0
```
To change the command used to clear the screen (It is `clear` by default):
```
let g:vim_clearcmd = "cls"
```
