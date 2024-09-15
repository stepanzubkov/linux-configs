#!/bin/bash

if [[ $# -gt 3 ]]; then
    echo "Only 3 arguments are allowed!"
    exit 1
fi

if [[ $# -lt 2 ]]; then
    echo "Pass at least 2 arguments!"
    exit 1
fi

if [[ $1 == "help" || $1 == "--help" || $1 == "-h" ]]; then
    cat << EOF
Usage: $0 (command) (config name) [destination]

Available commands:
    - install
    - uninstall
    - sync
Available configs: nvim
EOF
    exit
fi

CMD=$1
CFG=$2
DEST=$3

if [[ $CMD != "install" && $CMD != "sync" && $CMD != "uninstall" ]]; then
    echo "Command is invalid! See '$0 --help'"
    exit 1
fi

if [[ ! -d $CFG ]]; then
    echo "Choosed config don't exist!"
    exit 1
fi

if [[ ! -f "$CFG/$CMD.sh" ]]; then
    echo "Choosed command isn't configured for choosed config!"
    exit 1
fi

$CFG/$CMD.sh $DEST
