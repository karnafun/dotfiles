
path="https://raw.githubusercontent.com/karnafun/dotfiles/master"
oldname="$(date '+%y.%ml%d-%T')"
function backupdir(){
    if [[ ! -d ~/.karnafun/backup ]]; then
        mkdir ~/.karnafun/backup;
    fi
}

if [[ ! -d ~/.karnafun ]]; then 
    mkdir ~/.karnafun
else
    backupdir
    if [[ -f ~/.karnafun/functions.sh ]]; then 
        mv ~/.karnafun/functions.sh ~/.karnafun/backup/functions.$oldname
    fi
    if [[ -f ~/.karnafun/shortcuts.sh ]]; then 
        mv ~/.karnafun/shortcuts.sh ~/.karnafun/backup/shortcuts.$oldname
    fi
    if [[ -f ~/.karnafun/ps1.sh ]]; then 
        mv ~/.karnafun/ps1.sh ~/.karnafun/backup/ps1.$oldname
    fi
fi

curl -s $path/bash/shortcuts.sh > ~/.karnafun/shortcuts.sh
curl -s $path/bash/ps1.sh > ~/.karnafun/ps1.sh
echo "#!/bin/bash" > ~/.karnafun/functions.sh
curl -s $path/functions/research-clouds.sh >> ~/.karnafun/functions.sh
curl -s $path/functions/resize.sh>> ~/.karnafun/functions.sh
curl -s $path/functions/tmux.sh>> ~/.karnafun/functions.sh

#bashrc="$(curl $path/bash/.bashrc)"
#echo -e "$bashrc\n\nyour old bash:\n\n$(cat ~/.bashrc 2>/dev/null)" > ~/.bashrc
curl -s $path/bash/.bashrc >> ~/.bashrc && source ~/.bashrc
