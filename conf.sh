
path="https://raw.githubusercontent.com/karnafun/dotfiles/master"
oldname="$(date '+%y/%m/%d/%T')"
function backupdir(){
    if [[ -z ~/.karnafun/backup ]]; then
        mkdir ~/.karnafun/backup;
    fi
}

if [[ -z ~/.karnafun ]]; then 
    mkdir ~/.karnafun
elif [[ -f ~/.karnafun/functions.sh ]]; then 
    backupdir
    mv ~/.karnafun/functions.sh ~/.karnafun/functions.$oldname
elif [[ -f ~/.karnafun/shortcuts.sh ]]; then 
    backupdir
    mv ~/.karnafun/shortcuts.sh ~/.karnafun/shortcuts.$oldname
elif [[ -f ~/.karnafun/ps1.sh ]]; then 
    backupdir
    mv ~/.karnafun/ps1.sh ~/.karnafun/ps1.$oldname
fi

curl $path/bash/shortcuts.sh > ~/.karnafun/shortcuts.sh
curl $path/bash/ps1.sh > ~/.karnafun/ps1.sh
echo "#!/bin/bash" > ~/.karnafun/functions.sh
curl $path/research-clouds.sh >> ~/.karnafun/functions.sh
curl $path/resize.sh>> ~/.karnafun/functions.sh
curl $path/tmux.sh>> ~/.karnafun/functions.sh

#bashrc="$(curl $path/bash/.bashrc)"
#echo -e "$bashrc\n\nyour old bash:\n\n$(cat ~/.bashrc 2>/dev/null)" > ~/.bashrc
curl $path/bash/.bashrc >> ~/.bashrc
source ~/.bashrc
