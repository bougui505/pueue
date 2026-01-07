#!/usr/bin/env bash

#############################################################################
# Author: Guillaume Bouvier -- guillaume.bouvier@pasteur.fr                 #
# https://research.pasteur.fr/en/member/guillaume-bouvier/                  #
# Copyright (c) 2025 Institut Pasteur                                       #
#############################################################################
#
# creation_date: Wed Jan  7 09:32:50 2026

set -e  # exit on error
set -o pipefail  # exit when a process in the pipe fails
set -o noclobber  # prevent overwriting redirection

# Full path to the directory of the current script
DIRSCRIPT="$(dirname "$(readlink -f "$0")")"

# Start the pueued daemon (see: https://github.com/Nukesor/pueue and https://github.com/Nukesor/pueue/wiki/Get-started)
# Start pueued daemon with the command $HOME/bin/pueued -d only if not already running
if ! pgrep -f "pueued" > /dev/null; then
    $DIRSCRIPT/bin/pueued -d
fi

$DIRSCRIPT/bin/pueue $@
