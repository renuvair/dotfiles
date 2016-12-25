#!/bin/zsh


# clean existing zsh related files
rm -rf $HOME/.zprezto
rm -rf $HOME/.zlogin $HOME/.zlogout $HOME/.zpreztorc $HOME/.zprofile $HOME/.zshenv $HOME/.zshrc

# prezto setup
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
