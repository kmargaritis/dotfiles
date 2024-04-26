#!/usr/bin/env bash

# Npm packages
packages=(
  eslint
  jshint
  grunt-cli
  yo
  tern
  yaml2json
  gulp
  pm2
  mocha
  pug
  karma-cli
  babel-cli
  depcheck
  pug-lint
  # generator-api-service
  # nsp
  # jscs
  # jsxhint
  # bower
  # generator-angular-fullstack
  # requirejs
  # node-inspector
  # browserify
  # forever
  # forever-service
  # phonegap
  # jade-to-handlebars
  # sass-lint
)

npm install npm@10.6.0 -g

echo "installing npm packages..."
npm install -g  ${packages[@]}

# These packages will be added in quick install script for local repos
# socket.io
# memwatch-next
# commander
# chalk
# passport
# mysql
# bluebird
# karma
# underscore
# react
