#!/bin/bash

function tm () {

if  { [ "$TERM" = "screen-256color" ] && [ -n "$TMUX" ]; } then
    echo "already in a tmux session"
        return
fi

    
if [[ -z $1 ]]; then
    tmux attach -t base || tmux new -s base
else 
    tmux attach -t $1 || tmux new -s $1
fi
}
export tm
