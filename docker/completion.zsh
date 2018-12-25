# run script/install first

docker_completion_file="$DOTFILES/cache/docker-completion"
docker_compose_completion_file="$DOTFILES/cache/docker-compose-completion"

if test -f $docker_completion_file
then
  source $docker_completion_file
  if [ "$DOTFILES_DEBUG" = true ]; then echo "→→ docker completion loaded"; fi
fi

if test -f $docker_compose_completion_file
then
  source $docker_compose_completion_file
  if [ "$DOTFILES_DEBUG" = true ]; then echo "→→ docker compose completion loaded"; fi
fi