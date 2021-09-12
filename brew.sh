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
# brew install tmux
brew install curl
brew install curl-openssl
brew install git
brew install git-lfs
brew install bash
brew install imagemagick
# brew install mpv
brew install telnet
brew install openssl
brew install tree
brew install wget
brew install rsync
brew install dockutil
# brew install winetricks
brew install tor
brew install nmap
# brew install shellcheck
brew tap varenc/ffmpeg
brew install ffmpeg
# brew install youtube-dl
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
brew install kustomize
# brew install helmfile
# brew install packer
# brew install awsebcli
brew install aws-iam-authenticator
# brew install oath-toolkit
brew install mkcert

# lang
brew install golang
brew install python
brew install python3

# db
# brew tap mongodb/brew
# brew install mongodb-community
# brew install sqlite
# brew install leveldb
# brew install redis

# geo
brew install geos
brew install gdal
# brew install postgis

# html / pdf 
brew install tidy-html5


## use the brew bash version as default shell
if ! fgrep -q "/usr/local/bin/bash" /etc/shells; then
  echo "/usr/local/bin/bash" | sudo tee -a /etc/shells;
  sudo chsh -s /usr/local/bin/bash $(whoami)
fi;

brew install --cask iterm2
brew install --cask textmate
brew install --cask google-chrome
brew install --cask firefox
brew install --cask robo-3t
brew install --cask vlc
brew install --cask cyberduck
brew install --cask whatsapp
brew install --cask dropbox
brew install --cask tunnelblick
brew install --cask flux
brew install --cask transmission
brew install --cask clipy
brew install --cask qlstephen
brew install --cask qlmarkdown
# brew install --cask quicklook-json
brew install --cask tableplus
brew install --cask docker
brew install --cask lens
brew install --cask libreoffice
# brew install --cask xquartz
# brew install --cask wine-stable
brew install --cask visual-studio-code
# brew install --cask homebrew/cask-versions/adoptopenjdk8
# brew install --cask josm
# brew install --cask qgis
# brew install --cask virtualbox

brew cleanup
