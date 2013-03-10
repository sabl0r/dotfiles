#!/bin/bash

git pull

for c in bashrc bash_profile vim vimrc tmux.conf gitconfig
do
	ln -sfn ~/.dotfiles/$c ~/.$c
done

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

