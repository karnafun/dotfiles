#!/bin/bash

function resize() {
#check that somthing is a number ->     reg='^[0-9]+$' -> if [[ $var =~ $reg ]]
if [[ -n $1 && $1 == 'max' ]]; then
    printf '\e[9;1t' 
else
    echo "Please use the following:"
    echo "  max: maximize terminal"
fi
}
export resize;


