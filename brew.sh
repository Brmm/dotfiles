#!/bin/bash

set -v # echo commands on
set -e # quit on error
sudo -v

## Keep `sudo -v` alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
brew update

brew install coreutils
brew install bash-completion
brew install openssh
brew install nvm
brew install htop
brew install curl
brew install git
brew install ffmpeg
brew install bash
brew install imagemagick
brew install mpv
brew install mongodb
brew install openssl
brew install python
brew install python3
brew install sqlite
brew install tree
brew install wget
brew install youtube-dl
brew install rsync
brew install dockutil
brew install ansible
brew install mysql
brew install watchman
brew install jq
brew install wine
brew install tor
brew install awscli
brew install z
brew install diff-so-fancy
brew install oath-toolkit
brew install terraform
brew install nmap

## use the brew bash version as default shell
if ! fgrep -q "/usr/local/bin/bash" /etc/shells; then
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells;
  sudo chsh -s /usr/local/bin/bash $(whoami)
fi;

brew cask install iterm2
brew cask install textmate
brew cask install google-chrome
brew cask install firefox
brew cask install little-snitch
brew cask install robo-3t
brew cask install sublime-text
brew cask install vlc
brew cask install cyberduck
brew cask install google-chrome-canary
brew cask install whatsapp
brew cask install dropbox
brew cask install tunnelblick
brew cask install flux
brew cask install transmission
brew cask install virtualbox
brew cask install vagrant
brew cask install clipy
brew cask install sketch
brew cask install sequel-pro
brew cask install geektool
brew cask install google-cloud-sdk
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json

brew cleanup
