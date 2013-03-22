#!/bin/bash

git pull

# create symlinks for config files in home
for c in bashrc bash_profile vim vimrc tmux.conf gitconfig
do
	ln -sfn ~/.dotfiles/$c ~/.$c
done

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

# bash completion
BASH_COMP="ack base coreutils crontab eix eselect findutils gentoo git iconv make man mdadm munin-node mysqladmin postfix rsync screen ssh subversion tar tmux vim"

[[ ! -d ~/.bash_completion.d ]] && mkdir ~/.bash_completion.d

for b in $BASH_COMP
do
	ln -sfn /usr/share/bash-completion/$b ~/.bash_completion.d/$b
done

. ~/.bashrc

