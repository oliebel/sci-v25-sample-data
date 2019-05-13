# .bashrc
export EDITOR=vim

# User specific aliases and functions

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

alias l='ls -alF'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias pssh="pssh -h /root/phosts -i"

shopt -s histappend
PROMPT_COMMAND="history -a"

export KUBERNETES_MASTER=192.168.99.7:8080
