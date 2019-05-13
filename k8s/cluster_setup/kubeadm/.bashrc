# .bashrc

# User specific aliases and functions

#alias rm='rm -i'
#alias cp='cp -i'
#alias mv='mv -i'

export EDITOR=vim

alias l='ls -alF'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias pssh="pssh -h /root/phosts -i"

shopt -s histappend
PROMPT_COMMAND="history -a"


export KUBECONFIG=$HOME/.kube/config

