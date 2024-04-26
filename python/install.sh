#!/usr/bin/env bash
# http://virtualenvwrapper.readthedocs.org/en/latest/index.html

brew install python
brew install python3
brew install autoenv

brew install virtualenv
brew install virtualenvwrapper

mkdir ~/.virtualenvs

export WORKON_HOME=~/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
source /opt/homebrew/bin/virtualenvwrapper.sh
# mkvirtualenv venv
mkvirtualenv --python=`which python3` venv
workon venv

# pip should only run if there is a virtualenv currently activated
export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
export PIP_DOWNLOAD_CACHE=$HOME/Library/Caches/pip

pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install --upgrade wheel

pip3 install awsebcli
pip3 install powerline-status
# Codeintel issue with python3.
# pip install codeintel
pip3 install pyodbc
