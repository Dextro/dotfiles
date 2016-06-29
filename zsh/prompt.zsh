# load colors - https://wiki.archlinux.org/index.php/zsh#Colors
autoload -Uz colors && colors


unpushed () {
  $git cherry -v @{upstream} 2>/dev/null
}

need_push () {
  if [[ $(unpushed) == "" ]]
  then
    echo " "
  else
    echo " with %{$fg_bold[magenta]%}unpushed%{$reset_color%} "
  fi
}

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

rb_prompt() {
  if ! [[ -z "$(ruby_version)" ]]
  then
    echo "%{$fg_bold[yellow]%}$(ruby_version)%{$reset_color%} "
  else
    echo ""
  fi
}

# dump the current git branch
git_current_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

# dump the color to use based on the state of the git repo
git_dirty() {
  if $(! $git status -s &> /dev/null)
  then
    echo ""
  else
    if [[ $($git status --porcelain) == "" ]]
    then
      echo "$fg[green]"
    else
      echo "$fg[red]"
    fi
  fi
}

# dump git prompt information
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(git_dirty)$(git_current_branch)$reset_color"
}

# Get the current working directory
get_pwd() {
  echo "${PWD/$HOME/~}"
}

precmd() {
  title "zsh" "%m" "%55<...<%~"
  # export PROMPT=$' in $(directory_name) $(git_dirty)$(need_push)\n› '
  local LEFT
  local RIGHT
  local RIGHTWIDTH

  LEFT="$fg[cyan]%m: $fg[yellow]$(get_pwd)"
  RIGHT="$(git_prompt_info)"
  RIGHTWIDTH=$(($COLUMNS-${#LEFT}+${#RIGHT}))

  export PROMPT="
$LEFT${(l:$RIGHTWIDTH:::)RIGHT}
$reset_color→ "
  # export RPROMPT="%{$fg_bold[cyan]%} R $(rb_prompt)- P $(python_version)$(python_virtualenv)%{$reset_color%}"
  export RPROMPT=""
}
