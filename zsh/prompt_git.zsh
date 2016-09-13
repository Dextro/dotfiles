# Git prompt based on https://gist.github.com/joshdick/4415470

# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_PREFIX="%{$fg[white]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
GIT_PROMPT_REBASE="%{$fg[magenta]%}®%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg[red]%}●%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg[yellow]%}●%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg[green]%}●%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""
  local GIT_STATUS="$(git status --branch --porcelain)"

  local NUM_AHEAD="$(echo "$GIT_STATUS" | head -1 |
    grep 'ahead [0-9]*' | sed -e 's/.*ahead \([0-9]*\).*/\1/')"
  if [[ $NUM_AHEAD -gt 0 ]]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(echo "$GIT_STATUS" | head -1 |
    grep 'behind [0-9]*' | sed -e 's/.*behind \([0-9]*\).*/\1/')"
  if [[ $NUM_BEHIND -gt 0 ]]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [[ -n $GIT_DIR ]] && [[ -r $GIT_DIR/MERGE_HEAD ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $GIT_DIR ]] && [[ -d $GIT_DIR/rebase-apply ]] || [[ -d $GIT_DIR/rebase-merge ]] then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_REBASE
  fi

  if echo "$GIT_STATUS" | grep -q '^??'; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if echo "$GIT_STATUS" | grep -q '^.[DM]'; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if echo "$GIT_STATUS" | grep -q '^[ACDMR]'; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[white]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX"
}
