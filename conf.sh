#!/bin/bash
ThisRoot="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
function UserRoot() {
    cd ~
    ## for easy testing, cd to your testing directory
}
function Karnafun () {
    UserRoot
    if [ ! -d .karnafun ]; then mkdir .karnafun; fi
    cd .karnafun
    if [ ! -d functions ]; then mkdir functions;  fi
    cd functions
    for f in $ThisRoot/functions/*
    do
        cp $f $(basename $f)
    done
    cd ../.. ;

    #echo "Copied  from functions"
}

function GetBash(){
     UserRoot
    if [[ -f .bashrc ]];then
        echo "Your old .bashrc file was moved to ~/.karnafun/oldfiles/.bashrc"
        if [ ! -d .karnafun ]; then mkdir .karnafun; fi
        if [[ ! -d .karnafun/oldfiles ]]; then mkdir .karnafun/oldfiles; fi
        mv .bashrc .karnafun/oldfiles/.bashrc
    fi
    cp $ThisRoot/bash/.bashrc .bashrc 
    if [ ! -d .karnafun ]; then mkdir .karnafun; fi
    cd .karnafun
    cp $ThisRoot/bash/alias alias
    cp $ThisRoot/bash/export export
    cp $ThisRoot/bash/ps1 ps1
    cp $ThisRoot/bash/bookmarks bookmarks
    #echo "Copied from Bash"
}
function GetInputrc(){
    if [[ -f .inputrc ]];then
        echo "Your old .inputrc file was moved to .inputrc.oldfile"
        mv .inputrc .inputrc.oldfile
    fi
    cp $ThisRoot/bash/.inputrc .inputrc
}

function GetVim(){
      UserRoot
    if [[ -f .vimrc ]];then
        echo "Your old .vimrc file was moved to ~/.karnafun/oldfiles/.vimrc"
        if [ ! -d .karnafun ]; then mkdir .karnafun; fi
        if [[ ! -d .karnafun/oldfiles ]]; then mkdir .karnafun/oldfiles; fi
        if [ ! -d .karnafun/vim ]; then mkdir .karnafun/vim; fi
        mv .vimrc .karnafun/oldfiles/.vimrc
    fi
    cp $ThisRoot/vim/.vimrc .vimrc
    
}

function GetFull(){
GetBash
GetInputrc
Karnafun
GetVim
if [ -f research-clouds.sh ]; then rm research-clouds.sh; fi 
}

function GetRc(){
 UserRoot
cat $ThisRoot/functions/research-clouds.sh >./research-clouds.sh
echo "source ./research-clouds.sh" >> ./.bashrc
}


function Configure () {
    echo "full: gets all files from the dotfiles folder"
    echo "rc: gets the rc function ONLY"
    read -p  "full/rc? : " input
    if [ $input  == 'full' ]; then
      #  UserRoot()
      #  if [[ -d .karnafun ]]; then
      #      echo "already containting .karnafun folder. do you want to overwrite ? "
      #      read -p "(y/n)" _input
      #      if [[ $_input == 'y' || $_input == 'yes' || $_input == 'Y' ]]; then
      #         mv .karnafun .karnafun/old-folder
      #      else    
      #          exit
      #      fi
      #  fi 
        GetFull
    elif [ $input  == 'rc' ]; then GetRc
    else 
        echo "invalid input, please run script again"
        exit
    fi

}



    
Configure
