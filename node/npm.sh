#!/usr/bin/env bash

# Npm packages
packages=(
  jshint
  jscs
  jsxhint
  grunt-cli
  bower
  yo
  generator-angular-fullstack
  generator-api-service
  tern
  requirejs
)

echo "installing npm packages..."
npm install -g  ${packages[@]}
