#!/usr/bin/env bash

# Install command-line tools using Homebrew.



# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all


# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew tap homebrew/versions
brew install bash-completion2

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi


#ADDDD

brew install tree
brew install tmux
brew install python3


# Install Homebrew Cask
brew install caskroom/cask/brew-cask
# brew cask install google-chrome
# brew linkapps


# Remove outdated versions from the cellar.
brew cleanup
