# reset PATH variable
export PATH=$(getconf PATH)

# add homebrew stuff
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# add dotfiles bin folder to PATH
export PATH="$DOTFILES/bin:$PATH"

# add personal bin to PATH
export PATH="$HOME/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
