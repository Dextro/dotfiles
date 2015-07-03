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
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" > /tmp/homebrew-install.log
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --default-names
# Install Bash 4
brew install bash

# Install wget with IRI support
brew install wget --enable-iri

# Install more recent versions of some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/php/php55 --with-gmp
brew install git

# Install usefull binaries
brew install exiv2
brew install grc
brew install spark
brew install mtr
brew install mosh
brew install ack
brew install gpg
brew install node
brew install tree
brew install imagemagick --with-webp
brew install nmap
brew install rename

# https://github.com/github/hub
brew install hub

# https://github.com/jakubroztocil/httpie
brew install httpie

# https://github.com/sstephenson/rbenv
brew install rbenv ruby-build

# https://keybase.io
brew install keybase

# http://jonas.nitro.dk/tig/
brew install tig

# tmux
brew instal tmux

# https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
brew install reattach-to-user-namespace

# Homebrew cask
brew install caskroom/cask/brew-cask

brew cask install google-chrome
brew cask install moom
brew cask install google-cloud-sdk

exit 0
