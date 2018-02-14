#!/bin/bash

# echo "Updating all the things"
./update.sh

# echo "Setting OSX Defaults"
./osx.sh

# Create vim-tmp for swap files
mkdir -p ~/.vim-tmp

# make symbolic links from system dotfiles to repo
REPO_DIR=`pwd`

echo "Setting up symlinks for: bash_profile"
ln -nfs $REPO_DIR/bash_profile ~/.bash_profile

echo "Setting up symlinks for: vimrc"
ln -nfs $REPO_DIR/vimrc ~/.vimrc

echo "Setting up symlink for nvim"
mkdir -p ~/.config/nvim
ln -nfs $REPO_DIR/neovimrc ~/.config/nvim/init.vim

echo "Setting up symlinks for: ackrc"
ln -nfs $REPO_DIR/ackrc ~/.ackrc

echo "Setting up symlinks for: tmux.conf"
ln -nfs $REPO_DIR/tmux.conf ~/.tmux.conf

echo "Setting up inputrc for vi bindings by default"
ln -nfs $REPO_DIR/inputrc ~/.inputrc

cp vim/colors/* ~/.vim/colors/
# ln -fs $REPO_DIR/vim ~/.vim

# Hack to get colors working right
# git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
# vim +PluginInstall +qall
nvim +PlugInstall +qall
nvim +PlugUpgrade +qall
nvim +GoInstallBinaries +qall
nvim +GoUpdateBinaries +qall

# cp ~/.vim/bundle/base-16/colors/*.vim ~/.vim/colors/

# Git Stuff
# http://news.ycombinator.com/item?id=4130494
git config --global color.ui "auto"


