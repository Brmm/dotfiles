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
brew install htop
brew install tmux
brew install curl
brew install curl-openssl
brew install git
brew install git-lfs
brew install bash
brew install imagemagick
brew install mpv
brew install telnet
brew install openssl
brew install tree
brew install wget
brew install rsync
brew install dockutil
brew install winetricks
brew install tor
brew install nmap
# brew install shellcheck
brew tap varenc/ffmpeg
brew install ffmpeg
brew install youtube-dl
brew install diff-so-fancy
brew install z
brew install jq
brew install yq
# brew install opencv

# devops & cloud
brew install awscli
brew install kubernetes-cli
brew install terraform
brew install ansible
brew install pulumi
# brew install sops
brew install helm
# brew install helmfile
# brew install packer
# brew install awsebcli
# brew install aws-iam-authenticator
# brew install oath-toolkit

# lang
brew install golang
brew install python
brew install python3

# db
brew tap mongodb/brew
brew install mongodb-community
brew install sqlite
brew install leveldb
# brew install redis

# geo
brew install geos
brew install gdal
brew install postgis


## use the brew bash version as default shell
if ! fgrep -q "/usr/local/bin/bash" /etc/shells; then
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells;
  sudo chsh -s /usr/local/bin/bash $(whoami)
fi;

# brew tap homebrew/cask-version
brew cask install iterm2
brew cask install textmate
brew cask install google-chrome
brew cask install firefox
brew cask install robo-3t
brew cask install vlc
brew cask install cyberduck
brew cask install whatsapp
brew cask install dropbox
brew cask install tunnelblick
brew cask install flux
brew cask install transmission
# brew cask install vagrant
brew cask install clipy
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install tableplus
brew cask install docker
# brew cask install xquartz
# brew cask install wine-stable
brew cask install visual-studio-code
# brew cask install homebrew/cask-versions/adoptopenjdk8
# brew cask install josm
# brew cask install qgis
# brew cask install virtualbox

# brew cask install vox
# brew cask install sketch
# brew cask install sequel-pro
# brew cask install google-cloud-sdk
# brew cask install pgadmin4

brew cleanup
