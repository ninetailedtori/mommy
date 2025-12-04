#!/bin/env bash

## Four basics to writing Bash completions:
# COMPREPLY - array for possible completions
# COMP_WORDS - array of individual arguments typed so far
# COMP_CWORD - index of the command argument at cursor
# COMP_LINE - current command line

_mommy()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=($(compgen -W "-c --config -d --global-config-dirs -e --eval -h --help -p --pipefail -s --status -t --toggle -v --version" -- $cur))
}
complete -F _mommy mommy
