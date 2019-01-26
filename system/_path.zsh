# add homebrew paths to PATH
export PATH="/usr/local/sbin:$PATH"

# reset PATH variable
export PATH=$(getconf PATH)

# add homebrew stuff
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# add dotfiles bin folder to PATH
export PATH="$DOTFILES/bin:$PATH"

# add composer stuff to PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"

# add node stuff to PATH
export PATH="/usr/local/opt/node@8/bin:$PATH"

# php
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"

# add personal bin to PATH
export PATH="$HOME/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/mysql/man:/usr/local/git/man:$MANPATH"
