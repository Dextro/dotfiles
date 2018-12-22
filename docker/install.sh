#!/usr/bin/env bash

curl -L --silent https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker --output "$ZSH/cache/_docker_completion"
curl -L --silent https://raw.githubusercontent.com/docker/compose/master/contrib/completion/zsh/_docker-compose --output "$ZSH/cache/_docker_compose_completion"