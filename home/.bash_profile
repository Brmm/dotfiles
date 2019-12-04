#!/bin/bash

source ~/.exports
source ~/.aliases
source ~/.options
source ~/.functions
source ~/.bash_prompt
[ -f ~/.extra ] && source ~/.extra

# load z
. /usr/local/etc/profile.d/z.sh

# load nvm
source ~/.nvm/nvm.sh && nvm use 10
export NODE_PATH=~/.nvm/versions/node/$(node -v)/lib/node_modules/
export NODE_ENV='development'

# load bash completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # nvm bash completion
