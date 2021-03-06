#!/bin/bash
StartColor="\[\033]0;";
Green="\[\033[32m\]";
Green2="\[\033[01;32m\]";
Color="\[\033[35m\]";
Yellow="\[\033[33m\]";
LightBlue="\[\033[36m\]";
LightBlue2="\[\033[1;34m\]"
DarkGray="\[\033[1;30m\]"
Red="\[\033[31m\]"
ResetColor="\[\033[00m\]";
Title="$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]";


lb=$LightBlue2
dg=$DarkGray

## Git For Cygwin:
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/-(\1)/'
}
export -f parse_git_branch
export psv1="$dg($lb\t$dg)-($lb\h$dg)-($lb\W$dg)$Green2\$(parse_git_branch)$dg \n($Red\u$dg)$Red$ $ResetColor"
export psv2="\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[31m\]\$(parse_git_branch)\[\033[00m\] $ "
export psv3="$StartColor$Title\n$Green\u@\h$Color$MYSYSTEM$Yellow  \w$LightBlue\`__git_ps1\` $ResetColor\n\$ ";
export psv4="$StartColor$Title\n$Green\u@\h$Color$MYSYSTEM$Yellow  \w$LightBlue $ResetColor\n\$ "
export psv5="[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\h\[\033[00m\]] \[\033[01;34m\]\w\[\033[00m\]\$"
export psv6="$dg($lb\t$dg)-($lb\h$dg)-($lb\W$dg)\n($Red\u$dg)$Red$ $ResetColor"
export PS1=$psv1
