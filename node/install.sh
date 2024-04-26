#!/usr/bin/env bash

# https://github.com/creationix/nvm
# Install nodejs and iojs throught nvm.
# TODO: add more options
brew install nvm
source $(brew --prefix nvm)/nvm.sh
mkdir ~/.nvm
export NVM_DIR=~/.nvm;

# Install node & npm packages for 0.12.6

nvm install lts/gallium

nvm install lts/hydrogen

nvm install lts/iron
source ./node/npm.sh;

nvm install 22.0.0

nvm use lts/iron
nvm alias default lts/iron

ln -sf `which node` /opt/homebrew/bin/node
ln -sf `which jshint` /opt/homebrew/bin/jshint
ln -sf `which tern` /opt/homebrew/bin/tern
ln -sf `which grunt` /opt/homebrew/bin/grunt
ln -sf `which pug-lint` /opt/homebrew/bin/pug-lint
