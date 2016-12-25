#!/bin/bash


# clean existing vim files and symlinks
rm -f $HOME/.vimrc
rm -rf $HOME/.vim
rm -rf $PWD/src/.vim/bundle
rm -rf $PWD/src/.vim/.netrwhist

# clean existing .tmux.conf
rm -rf $HOME/.tmux.conf

# clean existing zsh related files
rm -rf .zprezto
rm -rf .zlogin .zlogout .zpreztorc .zprofile .zshenv .zshrc
