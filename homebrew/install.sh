#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)" > /tmp/homebrew-install.log
fi

# update
brew update

# Install homebrew packages
brew install wget grc coreutils spark mtr mosh ack

# https://github.com/github/hub
brew install hub

# https://github.com/jakubroztocil/httpie
brew install httpie

# https://github.com/sstephenson/rbenv
brew install rbenv ruby-build

exit 0
