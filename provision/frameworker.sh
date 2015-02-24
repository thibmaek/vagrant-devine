#!/usr/bin/env bash

if [[ $1 == 'thane' ]]; then
  git clone https://github.com/thibmaek/thane /vagrant/htdocs/thane
elif [[ $1 == 'iamdevlopr' ]]; then
  git clone https://github.com/gerbengeeraerts/IAMDEVLOPR /vagrant/htdocs/iamdevlopr
else
  echo ">>> No framework was selected, exiting"
  exit 1;
fi
