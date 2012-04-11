
# set locales
LANG="de_DE.utf8"
LC_CTYPE="de_DE.utf8"
LC_NUMERIC="de_DE.utf8"
LC_TIME="de_DE.utf8"
LC_COLLATE="de_DE.utf8"
LC_MONETARY="de_DE.utf8"
LC_MESSAGES="en_US.utf8"
LC_PAPER="de_DE.utf8"
LC_NAME="de_DE.utf8"
LC_ADDRESS="de_DE.utf8"
LC_TELEPHONE="de_DE.utf8"
LC_MEASUREMENT="de_DE.utf8"
LC_IDENTIFICATION="de_DE.utf8"

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
. /etc/profile.d/bash-completion.sh

# start keychain
if [ hash keychain 2>/dev/null ] && [ "$TERM" = "xterm" ]; then
	keychain -q ~/.ssh/id_rsa
	. ~/.keychain/$HOSTNAME-sh
fi

