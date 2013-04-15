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
	less $libPATH/README.md
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
    	less $libPATH/README.md
    ;;
	(--import|import)
		. $libPATH/import.sh
	;;
	(--all)
		
	;;
	(*)
        . $libPATH/import.sh
		lib "$@"
	;;
esac
