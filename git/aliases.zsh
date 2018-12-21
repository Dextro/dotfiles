# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
then
  alias git=$hub_path
fi

# main alias
alias g='git'

# The rest of my fun git aliases
alias gitpull='git pull --prune'
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gitpush='git push origin HEAD'
alias gitd='git diff'
alias gitco='git commit'
alias gitcoa='git commit -a'
alias gitch='git checkout'
alias gitcb='git copy-branch-name'
alias gitb='git branch'
alias gits='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gita='git add'
alias gitap='git add -p'
alias gitaa='git add -A' # stages all
alias gitamfi="git-amend"
alias gitcr="git-credit"
alias gitdellm="git-delete-local-merged"
alias gitnuke="git-nuke"
alias gitrank="git-rank-contributors"
alias gittr="git-track"
alias gittra="git-track-all"
alias gitundo="git-undo"
alias gitunp="git-unpushed"
alias gitunpstat="git-unpushed-stat"
alias gitup="git-up"
alias gitreup="git-reup"
alias gitwtf="git-wtf"