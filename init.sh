#!/bin/bash

git pull

for c in bashrc bash_profile vim vimrc
do
	ln -sfn ~/.dotfiles/$c ~/.$c
done

. ~/.bashrc

