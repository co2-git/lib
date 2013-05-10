#!/bin/bash

[ -z "$lib_path" ] && {
	[ -L "$0" ] && lib_path=$(dirname $(readlink "$0")) || 
	lib_path=$(dirname "$0")
}

[ ! -d "$lib_path" ] && [ ! "$1" = --help ] && {
    echo "lib_path not found! Try <lib --help> for help"
    exit
}

lib_default=hello;
. $lib_path/import.sh;
lib "$@";