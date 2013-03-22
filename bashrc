
# set locales
export LANG="de_DE.utf8"
export LC_CTYPE="de_DE.utf8"
export LC_NUMERIC="de_DE.utf8"
export LC_TIME="de_DE.utf8"
export LC_COLLATE="de_DE.utf8"
export LC_MONETARY="de_DE.utf8"
export LC_MESSAGES="en_US.utf8"
export LC_PAPER="de_DE.utf8"
export LC_NAME="de_DE.utf8"
export LC_ADDRESS="de_DE.utf8"
export LC_TELEPHONE="de_DE.utf8"
export LC_MEASUREMENT="de_DE.utf8"
export LC_IDENTIFICATION="de_DE.utf8"

# set bash prompt
if [[ ${EUID} == 0 ]] ; then
	PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
else
	PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] '
fi

# enable recursive globbing
shopt -s globstar

# enable spelling correction for path expansion
shopt -s dirspell

# disable command completion on empty command line
shopt -s no_empty_cmd_completion

# svn editor
export SVN_EDITOR=/usr/bin/vim
export EDITOR=/usr/bin/vim

# load aliases and functions
for c in ~/.dotfiles/{aliases,functions}
do
	if [[ -f "$c" ]]
	then
		. "$c"
	fi
done

# load bash completion
for b in /etc/profile.d/bash-completion.sh /etc/bash_completion
do
	[[ -f $b ]] && . $b
done

# start keychain
if hash keychain 2>/dev/null && [ "$TERM" == "xterm" ]; then
	eval `keychain --eval id_rsa`
elif [ -x /usr/bin/ssh-pageant ]; then
	eval $(/usr/bin/ssh-pageant -q)
fi

# local stuff
[[ -f ~/.dotfiles/bashrc.local ]] && . ~/.dotfiles/bashrc.local

