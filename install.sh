#!/bin/bash

# install vim
sudo apt-get -y install vim

# clean existing files and symlinks
rm -f $HOME/.vimrc
rm -rf $HOME/.vim
rm -rf $PWD/src/.vim/bundle
ln -s $PWD/src/.vim $HOME/.vim
ln -s $PWD/src/.vimrc $HOME/.vimrc

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# exec :PluginInstall; TODO find out why double q command is needed
vim -E -c PluginInstall -c q -c q

# install tmux
sudo apt-get -y install tmux
rm -rf $HOME/.tmux.conf
ln -s $PWD/src/.tmux.conf $HOME/.tmux.conf


#install zsh and prezto
rm -rf .zprezto
rm -rf .zlogin .zlogout .zpreztorc .zprofile .zshenv .zshrc
sudo apt-get -y install tmux

zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
