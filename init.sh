#!/bin/bash

git pull
git submodule init
git submodule update

# create symlinks for config files in home
for c in bashrc bash_profile bash_logout vim vimrc tmux.conf gitconfig curlrc
do
	ln -sfn ~/.dotfiles/$c ~/.$c
done

# install vim plugins via Vundle
vim +PluginInstall +PluginUpdate +qall

# install tmux plugins via tpm
tmux/plugins/tpm/bin/install_plugins

# powerline
POWERLINE_USER_PATH=~/.config/powerline
POWERLINE_DIRS=themes/tmux
POWERLINE_CONFIGS=themes/tmux/default.json

for d in $POWERLINE_DIRS
do
	[[ ! -d "$POWERLINE_USER_PATH/$d" ]] && mkdir -p "$POWERLINE_USER_PATH/$d"
done

for c in $POWERLINE_CONFIGS
do
	ln -sfn ~/.dotfiles/powerline/$c "$POWERLINE_USER_PATH/$c"
done

. ~/.bashrc

