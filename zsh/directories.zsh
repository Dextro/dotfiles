# Any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory, that will be used by the ‘%~’ and related
# prompt sequences, and will be available when completion is performed on a word
# starting with ‘~’. (Otherwise, the parameter must be used in the form
# ‘~param’ first.)
setopt auto_name_dirs

# Make cd push the old directory onto the directory stack
setopt auto_pushd

# Don’t push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# Exchanges the meanings of ‘+’ and ‘-’ when used with a number to specify
# a directory in the stack.
setopt pushdminus

# Easier navigation
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

# show directory stack (last 10 values)
alias d='dirs -v | head -10'

# get to previous directories on the stack
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# used by the easier navigation part
cd () {
  if   [[ "x$*" == "x..." ]]; then
    cd ../..
  elif [[ "x$*" == "x...." ]]; then
    cd ../../..
  elif [[ "x$*" == "x....." ]]; then
    cd ../../../..
  elif [[ "x$*" == "x......" ]]; then
    cd ../../../../..
  # Directory-based Environments - https://github.com/kennethreitz/autoenv
  elif [ -d /usr/local/opt/autoenv ]; then
    source /usr/local/opt/autoenv/activate.sh
    autoenv_init
  else
    builtin cd "$@"
  fi
}

# create directory/directories - create intermediate directories as required
alias md='mkdir -p'
# remove directory
alias rd=rmdir
