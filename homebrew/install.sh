#!/bin/sh
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "→→→ Installing Homebrew..."
  CI=1 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew
echo "→→→ Homebrew: update to latest version..."
brew update

# Upgrade any already-installed formulae
echo "→→→ Homebrew: upgrade all already-installed formulae..."
brew upgrade

# Homebrew bundle
echo "→→→ Homebrew: run bundle..."
brew bundle