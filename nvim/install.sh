#!/bin/bash

if [[ -n $1 ]]; then
    DEST=$1
else
    DEST=~/.config/nvim
fi

cp -r nvim/* $DEST
