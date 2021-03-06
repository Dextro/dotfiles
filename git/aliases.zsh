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
alias gpull='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gpush='git push origin HEAD'
alias gd='git diff'
alias gco='git commit'
alias gcoa='git commit -a'
alias gch='git checkout'
alias gcb='git copy-branch-name'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias ga='git add'
alias gap='git add -p'
alias gaa='git add -A' # stages all
alias gamfi="git-amend"
alias gcr="git-credit"
alias gdellm="git-delete-local-merged"
alias gnuke="git-nuke"
alias grank="git-rank-contributors"
alias gtr="git-track"
alias gtra="git-track-all"
alias gundo="git-undo"
alias gunp="git-unpushed"
alias gunpstat="git-unpushed-stat"
alias gup="git-up"
alias greup="git-reup"
alias gwtf="git-wtf"