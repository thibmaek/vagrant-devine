#!/usr/bin/env bash

# Check if Ruby is installed
ruby -v > /dev/null 2>&1
RUBY_IS_INSTALLED=$?

# Retrieve the list of Gems
GEM_LIST=($@)

if [[ $RUBY_IS_INSTALLED -ne 0 ]]; then
  echo ">>> Installing Ruby without RVM"
  sudo apt-get install -qq ruby-full rubygems1.9
else
  echo ">>> Updating Ruby with apt"
  sudo apt-get update -qq ruby > /dev/null 2>&1
fi

# Install (optional) Ruby Gems
if [[ ! -z $GEM_LIST ]]; then
    echo ">>> Installing those pretty gems"
    echo "    "$@
    sudo gem install ${GEM_LIST[@]}
fi
