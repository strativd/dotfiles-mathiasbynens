#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
#brew install bash
#brew tap homebrew/versions
#brew install bash-completion2

# Install other useful binaries.
brew install bat
brew install dark-mode
brew install git
brew install tree

# Install Apps
brew cask install maccy
brew cask install rectangle
brew cask install iterm2
brew cask install github-desktop
brew cask install google-chrome
brew cask install firefox
brew cask install slack
brew cask install spotify
brew cask install dropbox
brew cask install imageoptim
brew cask install cleanmymac

# Remove outdated versions from the cellar.
brew cleanup
