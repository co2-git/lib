#!/bin/bash

E_TRY_AGAIN=1
E_ALREADY_INSTALLED=2

if  lib >/dev/null 2>&1
    then
    if [ -n "$libPATH" ]
        then
        echo Looks\ like\ lib\ is\ already\ installed
        exit $E_ALREADY_INSTALLED
    fi
fi

read -p 'Use this directory => '$PWD' ? [Y/n] ' usePWD

case "$usePWD" in
    (Y|y|'')
        __into="$PWD"
    ;;
    (n|N)
        read -p "Enter a directory: " __into

        if [ ! -d "$__into" ]
            then
            echo Not\ a\ valid\ directory\: "$__into"
            exit $E_TRY_AGAIN
        fi
    ;;
esac

pointer=$__into/lib.sh

if [ ! -f "$pointer" ]
    then
    echo "lib not found in this directory. Do you wish to install it?"
    exit
else
    ln -s $pointer /usr/bin/lib
    echo libPATH=~/Projects/lib\ export\ libPATH; >> ~/.bashrc
fi