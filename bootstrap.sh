#!/bin/bash

set -v # echo commands on
set -e # quit on error
sudo -v

## Keep `sudo -v` alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Install binaries and applications with brew
chmod +x ./brew.sh
./brew.sh

# Helm
helm plugin install https://github.com/futuresimple/helm-secrets

# compile osmctools
cat files/osmctools/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
mv osmconvert /usr/local/bin/osmconvert

cat files/osmctools/osmfilter.c | cc -x c - -O3 -o osmfilter
mv osmfilter /usr/local/bin/osmfilter

## Copy dotfiles
cp ./home/.??* $HOME

## Run macos script
chmod +x ./macos.sh
./macos.sh

## Install node.js v10
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

## NPM
nvm install 10
nvm use 10
npm install -g create-react-native-app eslint lerna npm-check-updates prettier typescript yarn

## Copy iTerm2 settings
# defaults write com.googlecode.iterm2 HotkeyTermAnimationDuration -float 0.00001
cp "./files/com.googlecode.iterm2.plist" ~/Library/Preferences

## Copy f.lux settings
cp "./files/org.herf.Flux.plist" ~/Library/Preferences

## Configure the Dock
dockutil --remove all
dockutil --add "/System/Applications/Mail.app"
dockutil --add "/Applications/iTerm.app" --after "Mail"
dockutil --add "/Applications/Visual Studio Code.app"
dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/TextMate.app"
dockutil --add "/System/Applications/Messages.app"
dockutil --add "/Applications/WhatsApp.app"
dockutil --add "/Applications/FireFox.app"
dockutil --add "/Applications/Robo 3T.app"
dockutil --add "/Applications/Safari.app"
dockutil --add "/System/Applications/Calendar.app"
dockutil --add "/System/Applications/Notes.app"

open "/Applications/Clipy.app"
open "/Applications/Flux.app"
open "/Applications/Tunnelblick.app"
open "/Applications/iTerm.app"
open "/Applications/Dropbox.app"
open "/Applications/Docker.app"

# set default shell
chsh -s /usr/local/bin/bash
