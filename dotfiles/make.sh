#!/usr/bin/env bash

# Download the dotfiles first
# this can be done easier, looking into it
wget -P ~/dotfiles https://raw.githubusercontent.com/thibmaek/vagrant-devine/master/dotfiles/.bash_aliases
wget -P ~/dotfiles https://raw.githubusercontent.com/thibmaek/vagrant-devine/master/dotfiles/.bash_prompt
wget -P ~/dotfiles https://raw.githubusercontent.com/thibmaek/vagrant-devine/master/dotfiles/.bashrc
wget -P ~/dotfiles https://raw.githubusercontent.com/thibmaek/vagrant-devine/master/dotfiles/.functions
wget -P ~/dotfiles https://raw.githubusercontent.com/thibmaek/vagrant-devine/master/dotfiles/.hushlogin
wget -P ~/dotfiles https://raw.githubusercontent.com/thibmaek/vagrant-devine/master/dotfiles/.profile

# then cd to it and get to to ~
cd ~/dotfiles

# move the files
for file in ".bash_aliases" ".bashrc" ".functions" ".hushlogin" ".profile"; do
  mv "${file}" ~
done

# and clean up stuff
cd ~
rm -rf dotfiles
