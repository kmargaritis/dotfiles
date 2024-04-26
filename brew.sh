#!/usr/bin/env bash

# Install Homebrew command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing Homebrew for you."
  #ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  printf "Homebrew is already installed.\nProceeding with library installation."
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

brew install zsh
brew install zsh-completions

# Switch to using brew-installed bash as default shell
source .functions
updateShells

# Install `wget` with IRI support.
brew install wget

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp


# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install xz
brew install rsync
brew install freetds

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install rlwrap
brew install ssh-copy-id
brew install testssl
brew install tree
brew install vbindiff
brew install webkit2png
brew install zopfli
brew install ansible
# brew install mongodb
brew install z
brew install git-flow
brew install git-extras
brew install composer
brew install graphviz
# brew install pygtk
brew install terraform

#install Synergy dependencies
brew install cmake
brew install qt

#Install libraries for Software installation
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts
brew tap AdoptOpenJDK/openjdk
# brew tap homebrew/cask-cask

brew install brew-cask-completion

# Node and io.js manager
source ./node/install.sh;

# Install AWS CLI
brew install awscli

# Install RVM and Ruby
source ./ruby/install.sh;

# Install python, pip and virtualenv
source ./python/install.sh;

source ./php/install.sh;

# Install MAC OS apps
source ./cask/install.sh;

# Install Docker
source ./docker/install.sh;

# Install Jenv
source ./java/install.sh

# Install Jenv
source ./sonar/install.sh

# Heroku Toolbelt
brew tap heroku/brew && brew install heroku

brew install bfg
brew install xpdf

# Remove outdated versions from the cellar.
brew cleanup
