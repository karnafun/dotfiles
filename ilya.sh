#!/bin/bash

path="$(pwd)"
echo $path
if [[  $(pwd) == *"/research-clouds" ]]; then
    echo "i found research clouds in PWD"
else 
    echo "You must be at dude, you're in the wrong folder"
fi

string='My long string'
if [[ $string = *"My long"* ]]; then
  echo "It's there!"
fi
