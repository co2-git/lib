#!/bin/bash

E_TRY_AGAIN=1
E_ALREADY_INSTALLED=2
E_GIT_FAILURE=3
E_COULD_NOT_CREATE_SHORTCUT=4
E_COULD_NOT_ADD_TO_BASHRC=5

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
    read -p "lib not found in this directory. Do you wish to install it? [Y/n] " installlib

    if [ "$installlib" = Y -o "$installlib" = y -o -z "$installlib" ]
        then
        git clone git://github.com/co2-git/lib.git || exit $E_GIT_FAILURE
        __into="$__into/lib"
        pointer=$__into/lib.sh
    fi
fi

ln -s $pointer /usr/bin/lib || exit $E_COULD_NOT_CREATE_SHORTCUT
echo "libPATH=$__into export libPATH;" >> ~/.bashrc || exit $E_COULD_NOT_ADD_TO_BASHRC
source ~/.bashrc