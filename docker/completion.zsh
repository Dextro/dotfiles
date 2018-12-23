# run script/install first

docker_completion_file="$ZSH/cache/docker-completion"
docker_compose_completion_file="$ZSH/cache/docker-compose-completion"

if test -f $docker_completion_file
then
  source $docker_completion_file
  echo "→ docker completion loaded"
fi

if test -f $docker_compose_completion_file
then
  source $docker_compose_completion_file
  echo "→ docker compose completion loaded"
fi