# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=false

# add pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"