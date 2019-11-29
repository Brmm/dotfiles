#!/bin/bash

set -v # echo commands on
set -e # quit on error
sudo -v

## Keep `sudo -v` alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Install binaries and applications with brew
chmod +x ./brew.sh
./brew.sh

## Copy dotfiles
cp ./home/.??* $HOME

## Run macos script
chmod +x ./macos.sh
./macos.sh

## Install node.js + global modules
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 12
nvm use 12
npm install -g eslint npm npm-check-updates create-react-native-app yarn serverless typescript prettier lerna

## Copy iTerm2 settings
# defaults write com.googlecode.iterm2 HotkeyTermAnimationDuration -float 0.00001
cp "./files/com.googlecode.iterm2.plist" ~/Library/Preferences

## Configure the Dock
open "/Applications/iTunes.app"

dockutil --remove all
dockutil --add "/Applications/Mail.app"
dockutil --add "/Applications/iTerm.app" --after "Mail"
dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/TextMate.app"
dockutil --add "/Applications/Visual Studio Code.app"
dockutil --add "/Applications/Messages.app"
dockutil --add "/Applications/WhatsApp.app"
dockutil --add "/Applications/iTunes.app"
dockutil --add "/Applications/FireFox.app"
dockutil --add "/Applications/Safari.app"
dockutil --add "/Applications/Calendar.app"
dockutil --add "/Applications/Notes.app"

open "/Applications/Sublime Text.app"
open "/Applications/Clipy.app"
open "/Applications/Flux.app"
open "/Applications/Tunnelblick.app"
open "/Applications/iTerm.app"
open "/Applications/Dropbox.app"
open "/Applications/Docker.app"
