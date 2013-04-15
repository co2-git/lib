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

dude@machine ~ $ `lib Text.bold This text will be output in bold\!`

## Script integration user story

    #!/bin/bash

    ## Import lib into your script's scope

    lib --import

    ## Now you call any lib function you want, it will be called within the process

    lib test This is a test
    lib Text.color green This text will appear in green
    lib Array.join , 1 2 3 4
