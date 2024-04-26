#!/usr/bin/env bash

# You can check available fonts here
# https://github.com/caskroom/homebrew-fonts/tree/master/Casks

# Apps
apps=(
  teamviewer
  anydesk
  #google-backup-and-sync
  alfred
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlprettypatch
  quicklook-csv
  betterzip
  qlimagesize
  suspicious-package
  webpquicklook
  apparency
  #hyperswitch
  dropbox
  google-chrome
  google-chrome-canary
  #google-hangouts
  firefox
  firefox-developer-edition
  keka
  opera
  slack
  #hipchat
  #gitter
  skype
  spotify
  appcleaner
  karabiner-elements
  #flash-player
  iterm2
  #shiori
  #atom
  sublime-text
  visual-studio-code
  texmaker
  yemuzip
  #jeromelebel-mongohub
  mysqlworkbench
  #sequel-pro
  sequel-ace
  mamp
  cyberduck
  transmission
  dash
  vlc
  cheatsheet
  eclipse-ide
  github
  # java
  # java11
  temurin
  #java6
  sourcetree
  #flashlight
  fluid
  #spectacle
  rectangle
  docker
  xquartz
  font-inconsolata
  font-anonymous-pro
  font-anonymice-powerline
  font-courier-prime
  font-source-code-pro
  font-source-code-pro-for-powerline
  gas-mask
  # soundnode
  #virtualbox
  utm
  # tunnelblick
  vagrant
  vagrant-manager
  # slate
  # bee (if available)
  # Majic (attlasian)
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew install --cask --no-quarantine --appdir="/Applications" ${apps[@]}

brew cleanup


# brew tap homebrew/cask-versions


# xattr -r ~/Library/QuickLook

# xattr -d -r com.apple.quarantine ~/Library/QuickLook