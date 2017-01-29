# load colors - https://wiki.archlinux.org/index.php/zsh#Colors

setopt prompt_subst
autoload -Uz colors && colors

ruby_version() {
  if (( $+commands[rbenv] ))
  then
    echo "$(rbenv version | awk '{print $1}')"
  fi

  if (( $+commands[rvm-prompt] ))
  then
    echo "$(rvm-prompt | awk '{print $1}')"
  fi
}

python_version() {
  if (( $+commands[python] ))
  then
    echo "$(python --version 2>&1 | awk '{print $2}')"
  fi
}

python_virtualenv() {
  if [ -n "$VIRTUAL_ENV" ]; then
    if [ -f "$VIRTUAL_ENV/__name__" ]; then
      local name=`cat $VIRTUAL_ENV/__name__`
    elif [ `basename $VIRTUAL_ENV` = "__" ]; then
      local name=$(basename $(dirname $VIRTUAL_ENV))
    else
      local name=$(basename $VIRTUAL_ENV)
    fi
    echo " $name"
  fi
}

ruby_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
  else
    echo ""
  fi
}

precmd() {
  # set title of the window/tab
  case $TERM in
    xterm*)
      print -Pn "\e]0;%n: %~\a"
      ;;
  esac

  # set prompt
  export PROMPT="
%{$fg[magenta]%}%*%{$reset_color%} - %{$fg[yellow]%}%~
%{$reset_color%}→ "

  export RPROMPT="$(git_prompt_string)"
}
