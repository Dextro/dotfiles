## Command history configuration
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000

setopt extended_history # add timestamps to history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share history between sessions
setopt append_history # sessions will append their history list to the history file, rather than overwrite it

# history
alias history='fc -ilr 1 | less'
alias h='history'
