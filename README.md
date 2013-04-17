# lib 
===

A command line framework in bash offering a set of utilities/helpers to ease coding in bash.

## About

lib offers a set of functions in bash that are helpers that can be called from the terminal or be included in the scope of a bash script. For better usability, functions are ordered by namespsaces.

## Usage

    lib <function-name> [<function-arguments>...]
    lib --all # view all functions
    lib --all --namespace  # view all namespaces
    lib --all --namespace Regex # view all functions under the namespace Regex
    lib --all Array.join # view documentation for specific function (here Array.join)


## Terminal user story

dude@machine ~ $ `lib Text.bold This text will be output in bold\!`

## Script integration user story

    #!/bin/bash

    ## Import lib into your script's scope

    lib --import

    ## Now you call any lib function you want, it will be called within the process

    lib test This is a test
    lib Text.color green This text will appear in green
    lib Array.join , 1 2 3 4

## Installation

### As sudo (global install)

    git clone https://github.com/co2-git/lib.git
    sudo ln -s lib/lib.sh /usr/bin/lib
    
### Local install
    git clone https://github.com/co2-git/lib.git
    echo "alias lib='/path/to/lib/lib.sh'" >> ~/.bashrc
    source ~/.bashrc
