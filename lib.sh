#!/bin/bash

[ -z "$libPATH" ] && {
	[ -L "$0" ] && libPATH=$(dirname $(readlink "$0")) || libPATH=$(dirname "$0")
}

[ ! -d "$libPATH" ] && [ ! "$1" = --help ] && {
    echo "libPATH not found! Try <lib --help> for help"
    exit
}

if [ $# -eq 0 ]
	then
	cat $libPATH/README.md
	echo
	echo -n "Status for you ($(whoami))"
	if [ -n "$libPATH" ]
		then
		echo ' You can use lib :)'
	else
		echo ' You cannot use lib :( Please set $libPATH in your .bashrc'
	fi
fi

case "$1" in
    (--help)
        curl https://raw.github.com/co2-git/lib/master/README.md
    ;;
	(--import|import)
		. $libPATH/import.sh
	;;
	(--all)
		
	;;
	(*)
        source $libPATH/import.sh
		lib "$@"
	;;
esac
