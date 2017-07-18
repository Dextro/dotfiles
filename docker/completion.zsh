# https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker

completion='$(pwd)/_docker'

if test -f $completion
then
  source $completion
fi
