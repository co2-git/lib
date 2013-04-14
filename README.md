# lib 
===

A command line framework in bash

===
### ALPHA VERSION
===

## About

I have developed `lib` because when I have to do a bash script, I often end up writing the same functions over and over again. I wanted to store them somewhere and to be able to easily import them in the scope of my script.

## Usage

`lib <function-name> [<function-arguments>...]`

## Terminal user story

dude@machine ~ $ `lib text.bold This text will be output in bold\!`

## Script integration user story

    #!/bin/bash

    ## Import lib into your script's scope

    . $(lib --import)

    ## Now you call any lib function you want, it will be called within the process

    lib test This is a test

## Portability

You can run the script `make.sh` to globally install `lib` in your workstation. Yet, each non sudo-user should ask their workstation admin to give them path to `lib` and then declare it as `$libPATH` in his `~/.bashrc` file. For example:

    $ echo "libPATH=/opt/lib export libPATH;" >> ~/.bashrc
    $ source ~/.bashrc
    
## Dependencies

    aptitude install curl
