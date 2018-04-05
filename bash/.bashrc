#!/bin/bash 

if [[ -d ~/.karnafun ]]; then
	source ~/.karnafun/shortcuts.sh
    source ~/.karnafun/ps1.sh
    source ~/.karnafun/functions.sh
	#for f in ~/.karnafun/functions/*
	#do
	#	source $f
	#done
fi

if [[ -e /etc/bash_completion ]]; then
	. /etc/bash_completion
fi
