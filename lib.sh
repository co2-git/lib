#!/bin/bash
[ -z "$lib_path" ] && {
	lib_path="${BASH_SOURCE[0]:-$0}";
	while [ -h "$lib_path" ]
	do
		lib_path="$(readlink "$lib_path")";
	done
	lib_path="$(dirname "$lib_path")";
};
[ ! -d "$lib_path" ] && [ ! "$1" = --help ] && {
    echo "lib_path not found! Try <lib --help> for help"
    exit
};

lib_default=hello;
. $lib_path/import.sh;
lib "$@";