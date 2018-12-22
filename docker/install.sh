#!/usr/bin/env bash

curl -L --silent https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker --output "$(pwd)/cache/_docker_completion"
curl -L --silent https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose --output "$(pwd)/cache/_docker_compose_completion"