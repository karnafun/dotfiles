#!/bin/bash


 # alias
alias chrome="C:/'Program Files (x86)'/google/chrome/application/chrome.exe"
alias vs="'C:/Applications/Visual Studio/Common7/IDE/devenv.exe'"
alias ll='ls -l --color'
alias la='ls -a --color'
alias lla='ls -la --color'
alias grep='grep --color'
alias ls='ls --color'
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias desktop='cd /cygdrive/c/users/admin/desktop'
alias ..='cd ..'
alias ....='cd ../..'
#alias clear='clear && source ~/.bashrc && echo resourced'

## export variabls
export PATH=$PATH:/mnt/c/Windows
export PATH=$PATH:~/bin
export PATH=$PATH:'C:\Program Files (x86)\Python36-32'
export PATH=$PATH:C:/'Program Files (x86)'/Python36-32
export VISUAL=vim
export EDITOR="$VISUAL"
export HISTIGNORE="&:??:[ ]*:clear:exit:logout"

## export small functions

function bm {  
 case $1 in
 	'moodle' )
	chrome moodle.ruppin.ac.il;;
	'ruppinet' )
	chrome ruppinet.ruppin.ac.il;;
	'ruppin' )
	chrome www.ruppin.ac.il;;
	'rc' )
	chrome https://proj.ruppin.ac.il/bgroup62/prod/assets/html/Login.html;;
    'rc-git')
    chrome https://github.com/karnafun/research-clouds;;
esac
}

