#!/bin/bash

git pull
git submodule init
git submodule update

# Download nordtheme dircolors
curl -o ~/.dotfiles/dir_colors https://raw.githubusercontent.com/nordtheme/dircolors/develop/src/dir_colors

# create symlinks for config files in home
for c in bashrc bash_profile bash_logout vim vimrc tmux.conf gitconfig curlrc dir_colors
do
	ln -sfn ~/.dotfiles/$c ~/.$c
done

# install vim plugins via Vundle
vim +PluginInstall +PluginUpdate +PluginClean +qall

# install tmux plugins via tpm
tmux/plugins/tpm/bin/install_plugins

# Create symlinks in ~/.config
for c in bat
do
	for f in $(find ${c} -type f)
	do
		target_dir=~/.config/$(dirname ${f})
		[[ ! -d ${target_dir} ]] && mkdir -p ${target_dir}
		ln -sfn ~/.dotfiles/${f} ${target_dir}/$(basename ${f})
	done
done

. ~/.bashrc

