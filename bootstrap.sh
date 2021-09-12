#!/bin/bash

set -v # echo commands on
set -e # quit on error
sudo -v

## Keep `sudo -v` alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

## Use cloudflare DNS
sudo networksetup -setdnsservers "USB 10/100/1000 LAN" 1.1.1.1 1.0.0.1
sudo networksetup -setdnsservers "Wi-Fi" 1.1.1.1 1.0.0.1

## Install binaries and applications with brew
chmod +x ./brew.sh
./brew.sh

## Copy dotfiles
cp ./home/.??* $HOME

## Run macos script
chmod +x ./macos.sh
./macos.sh

## Copy iTerm2 settings
cp "./files/com.googlecode.iterm2.plist" ~/Library/Preferences

# compile osmctools
cat files/osmctools/osmconvert.c | cc -x c - -lz -O3 -o osmconvert
mv osmconvert /usr/local/bin/osmconvert

cat files/osmctools/osmfilter.c | cc -x c - -O3 -o osmfilter
mv osmfilter /usr/local/bin/osmfilter

## Install node.js v14
curl -o- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 14
nvm use 14

## NPM
npm install -g yarn npm lerna npm-check-updates prettier serve typescript eslint eslint-config-prettier eslint-plugin-prettier @typescript-eslint/eslint-plugin @typescript-eslint/parser

## Configure the Dock
dockutil --remove all
dockutil --add "/System/Applications/Mail.app"
dockutil --add "/Applications/iTerm.app" --after "Mail"
dockutil --add "/Applications/Visual Studio Code.app"
dockutil --add "/Applications/Google Chrome.app"
dockutil --add "/Applications/TextMate.app"
dockutil --add "/System/Applications/Messages.app"
dockutil --add "/Applications/WhatsApp.app"
dockutil --add "/Applications/Lens.app"
dockutil --add "/Applications/Firefox.app"
dockutil --add "/Applications/Robo 3T.app"
dockutil --add "/Applications/TablePlus.app"
dockutil --add "/Applications/Safari.app"
dockutil --add "/System/Applications/Calendar.app"
dockutil --add "/System/Applications/Notes.app"

