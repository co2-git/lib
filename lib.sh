#!/bin/bash

source $libPATH/import.sh

if [ $# -eq 0 ]
	then
	cat $libPATH/README.md
fi

case "$1" in
	(--import|import)
		echo $libPATH/import.sh
	;;
	(*)
		lib "$@"
	;;
esac