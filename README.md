lib
===

lib | a command line framework

## Nutshell

lib is a collection of utilities and helpers functions for bash
and meant to be easily imported into a script

## Terminal user story

dude@machine ~ $ `lib text.bold This text will be output in bold\!`

## Script integration user story

`#!/bin/bash`

`## Import lib into your script's scope`

`. $(lib --import)`

`## Now you call any lib function you want, it will be called within the process`

`lib test This is a test`