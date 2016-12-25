#!/bin/bash

# vim
sudo apt-get -y install vim

ln -s $PWD/src/.vim $HOME/.vim
ln -s $PWD/src/.vimrc $HOME/.vimrc

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# TODO find out why double q command is needed
vim -E -c PluginInstall -c q -c q

# tmux
sudo apt-get -y install tmux
ln -s $PWD/src/.tmux.conf $HOME/.tmux.conf

# zsh
sudo apt-get -y install zsh 

# prezto
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
