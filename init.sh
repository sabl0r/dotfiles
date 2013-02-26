#!/bin/bash

git pull

for c in bashrc bash_profile vim vimrc tmux.conf gitconfig
do
	ln -sfn ~/.dotfiles/$c ~/.$c
done

. ~/.bashrc

