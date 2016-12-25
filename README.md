# dotfiles
dotfiles for unix environments

# where to start
Using a clean Ubuntu installation:

1. sudo apt-get install git
2. git clone https://github.com/renuvair/dotfiles.git
3. cd dotfiles
4. sudo ./clean.sh
5. sudo ./install.sh
6. sudo ./prezto.sh
7. sudo chsh -s /bin/zsh
8. Relog into your user

You're done!
OBS: Only working for ubuntu os. Developed on xubuntu 16.10

# features
Fully-fledged vim, tmux, zsh + prezto combination

# known issues
- Problem: tmux does not work correclty with vim themes
- Solution: run: tmux -2 when starting tmux (forces tmux to work with 256 colors). Add: tmux -2 to .zshrc file (the file might be read-only).
