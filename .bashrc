#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GOPATH=~/go
export PATH="$PATH:$GOPATH/bin"
export EDITOR=vim

alias ls='ls --color=auto'
alias evim='$EDITOR ~/.vimrc'
alias evash='$EDITOR ~/.bashrc'
alias rehash='source ~/.bashrc'

PS1='[\u@\h \W]\$ '
