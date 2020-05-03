
# define color variables
cblack="\[\033[0;30m\]"
cblue="\[\033[0;34m\]"
cgreen="\[\033[0;32m\]"
ccyan="\[\033[0;36m\]"
cred="\[\033[0;31m\]"
cpurple="\[\033[0;35m\]"
cbrown="\[\033[0;33m\]"
clgray="\[\033[0;37m\]"
cdgray="\[\033[1;30m\]"
clblue="\[\033[1;34m\]"
clgreen="\[\033[1;32m\]"
clcyan="\[\033[1;36m\]"
clred="\[\033[1;31m\]"
clpurple="\[\033[1;35m\]"
cyellow="\[\033[1;33m\]"
cwhite="\[\033[1;37m\]"
cnone="\[\033[0m\]"

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

# set bash history size
export HISTSIZE=1000000
export HISTFILESIZE=$HISTSIZE

# append to the Bash history file, rather than overwriting it
shopt -s histappend

# enable recursive globbing
shopt -s globstar

# enable spelling correction for path expansion
shopt -s dirspell

# disable command completion on empty command line
shopt -s no_empty_cmd_completion

# check the window size after each command
shopt -s checkwinsize

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

# start keychain
if [[ -f ~/.ssh/id_rsa ]] && hash keychain 2>/dev/null && [ "$TERM" == "xterm" ]; then
	eval `keychain --eval id_rsa`
elif [ -x /usr/bin/ssh-pageant ]; then
	eval $(/usr/bin/ssh-pageant -q)
fi

# bash prompt segments

# user and hostname
function __ps1_userhost() {

	if [[ ${EUID} == 0 ]]; then
		echo -n "$clred\h$cnone "
	else
		echo -n "$clgreen\u@\h$cnone "
	fi

}

# current directory
function __ps1_dir() {
	echo -n "$clblue\w$cnone "
}

# end marker
function __ps1_end() {
	echo -n "$clblue\$$cnone "
}

# background jobs
function __ps1_bgjobs() {
	echo -n "$cnone\$(hasjobs=\$(jobs -p); echo \${hasjobs:+${cdgray}(${clred}\j${cdgray})${cnone}\ })"
}

# check if __git_ps1 function is provided by bash completion and load git-prompt otherwise
[ "`type -t __git_ps1`" = "function" ] || . ~/.dotfiles/git-prompt.sh

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1

# git informations
function __ps1_git() {

	# Collect some additional information to put into format string for __git_ps1
	git_status="$(git status 2> /dev/null)"
	remote_pattern="Your branch is (behind|ahead)"
	diverge_pattern="Your branch and (.*) have diverged"

	remote=""
	if [[ $git_status =~ $remote_pattern ]]; then
		if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
			remote=" $cyellow▲"
		else
			remote=" $cyellow▼"
		fi
	fi

	if [[ $git_status =~ $diverge_pattern ]]; then
		remote=" $cyellow"
	fi

	__git_ps1 "$cpurple(%s$remote$cpurple)$cnone "

}

# set bash prompt
PROMPT_COMMAND='PS1=$(__ps1_userhost;__ps1_dir;__ps1_git;__ps1_bgjobs;__ps1_end)'

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# local stuff
[[ -f ~/.dotfiles/bashrc.local ]] && . ~/.dotfiles/bashrc.local

