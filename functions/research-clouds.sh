#!/bin/bash
function ConfigureFiles(){
 local configFile="~/.karnafun/.Web.config";
if [[ !  -f  $configFile ]]; then
    if [[ -f ~/.Web.config ]];then
        configFile="~/.Web.config"l
    elif [[ -f /cygdrive/c/applications/cygwin/home/admin/.karnafun/.Web.config ]];then
        configFile="/cygdrive/c/applications/cygwin/home/admin/.karnafun/.Web.config";
    else 
        echo "Didnt find .Web.config file."
        echo "Please make sure you have the original Web.config file in one of the following locations:"
        echo "~/.Web.config OR ~/.karnafun/.Web.config"
        return;
    fi
fi 
if [[  $(pwd) == *"/research-clouds" ]]; then
    echo "Configuring Web.config"
    cat $configFile > Web.config
    git update-index --assume-unchanged Web.config
else 
    echo "Wrong Folder ! "
fi
}
function CloneRepo(){
    git clone https://github.com/karnafun/research-clouds 
    cd research-clouds
    ConfigureFiles
}
function rc () {
## Configure Shit
local instructions=" init / start / clone:"  
instructions+=$'\n';
instructions+="     Clone and configure research clouds repository"
instructions+=$'\n';
instructions+="   config , web  , bgroup";
instructions+=$'\n';
instructions+="     Fill Web.config with credentials and configures connection string to test1"


### Actually do somthing
if [ -z $1 ]; then
    echo "$instructions"
 elif [ $1 == 'init' ] || [ $1 == 'start' ] || [ $1 == 'clone' ]; then
     CloneRepo
 elif [ $1 == 'config' ] || [ $1 == 'web' ] || [ $1 == 'bgroup' ] ; then
   ConfigureFiles
 else 
     echo "Invalid action:"
     echo "$instructions"
 fi
}

export rc



