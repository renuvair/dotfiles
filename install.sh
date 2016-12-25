#!/bin/bash

# vim
apt-get -y install vim

ln -s $PWD/src/.vim $HOME/.vim
ln -s $PWD/src/.vimrc $HOME/.vimrc

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# TODO find out why double q command is needed
vim -E -c PluginInstall -c q -c q

# tmux
apt-get -y install tmux
ln -s $PWD/src/.tmux.conf $HOME/.tmux.conf

# zsh
apt-get -y install zsh 

# -- continue with prezto.sh
