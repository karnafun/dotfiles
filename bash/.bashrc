#!/bin/bash 

if [[ -d ~/.karnafun ]]; then
	source ~/.karnafun/alias
	source ~/.karnafun/export
	source ~/.karnafun/bookmarks
	for f in ~/.karnafun/functions/*
	do
		source $f
	done
fi

if [[ -e /etc/bash_completion ]]; then
	. /etc/bash_completion
fi
