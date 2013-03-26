#!/bin/bash

[ -z "$libPATH" ] && [ ! "$1" = --help ] && {
    echo "libPATH not found! Try <lib --help> for help"
    exit
}

source $libPATH/import.sh

if [ $# -eq 0 ]
	then
	cat $libPATH/README.md
fi

case "$1" in
    (--help)
        cat $libPATH/README.md
    ;;
	(--import|import)
		echo $libPATH/import.sh
	;;
	(*)
		lib "$@"
	;;
esac