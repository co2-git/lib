#!/bin/bash

[ -z "$libPATH" ] && [ ! "$1" = --help ] && {
    echo "libPATH not found! Try <lib --help> for help"
    exit
}

if [ $# -eq 0 ]
	then
	cat $libPATH/README.md
fi

case "$1" in
    (--help)
        curl https://raw.github.com/co2-git/lib/master/README.md
    ;;
	(--import|import)
		echo $libPATH/import.sh
	;;
	(*)
        source $libPATH/import.sh
		lib "$@"
	;;
esac