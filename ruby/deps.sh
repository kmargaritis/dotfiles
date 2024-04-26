#!/usr/bin/env bash

rvm use 2.7.8
gem install bundler -v 2.4.22
gem install sass-embedded -v 1.63.6
gem install nokogiri -v 1.15.6
gem install jekyll rails passenger cheatset sass --no-document

# cheatset gem compatible with sqllite < 1.4 which fails to install
rvm use 3.2.3
gem install bundler jekyll rails passenger sass --no-document

rvm use 3.3.1
gem install bundler jekyll rails passenger sass --no-document

rvm use 3.3.1 --default
