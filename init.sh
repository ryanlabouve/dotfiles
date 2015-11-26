#!/bin/bash

echo "Updating all the things"
./update.sh

echo "Setting OSX Defaults"
./osx.sh

# Create vim-tmp for swap files
mkdir -p ~/.vim-tmp

# make symbolic links from system dotfiles to repo
REPO_DIR=`pwd`

echo "Setting up symlinks for: bash_profile"
ln -nfs $REPO_DIR/bash_profile ~/.bash_profile

echo "Setting up symlinks for: vimrc"
ln -nfs $REPO_DIR/vimrc ~/.vimrc

echo "Setting up symlinks for: ackrc"
ln -nfs $REPO_DIR/ackrc ~/.ackrc

echo "Setting up symlinks for: tmux.conf"
ln -nfs $REPO_DIR/tmux.conf ~/.tmux.conf

# ln -fs $REPO_DIR/vim ~/.vim

# Git Stuff
# http://news.ycombinator.com/item?id=4130494
git config --global color.ui "auto"
