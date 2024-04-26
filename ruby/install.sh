#!/usr/bin/env bash

gpg --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Check for rvm
if test ! $(which rvm); then
  echo "Installing RVM for you."
  # ruby -e "$(curl -sSL https://get.rvm.io | bash -s stable)"
  \curl -sSL https://get.rvm.io | bash
else
  printf "RVM is already installed."
fi

export PATH="$HOME/.rvm/bin:$PATH";
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#rvm install 1.9.3 --with-gcc=clang
#rvm install 2.2.10
#rvm install 2.3.7
#rvm install 2.6.5
rvm install 2.7.8
rvm install 3.2.3
rvm install 3.3.1


# Install gems
source ./ruby/deps.sh;
