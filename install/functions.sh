#!/bin/bash
path="https://raw.githubusercontent.com/karnafun/dotfiles/master/functions"
oldname="$(date '+%y/%m/%d/%T')"



if [[ -f ~/.karnafun/functions.sh ]]; then
    if [[ -z ~/.karnafun/backup ]]; then mkdir ~/.karnafun/backup; fi
    mv ~/.karnafun/functions.sh ~/.karnafun/backup/.functions.$oldname
    echo "old functions.sh  moved to backup"
fi

if [[ -z ~/.karnafun ]]; then mkdir ~/.karnafun; fi

echo "#!/bin/bash" > ~/.karnafun/.functions.sh
curl $path/research-clouds.sh >> ~/.karnafun/.functions.sh
curl $path/resize.sh>> ~/.karnafun/.functions.sh
curl $path/tmux.sh>> ~/.karnafun/.functions.sh

echo -e "source ~/.karnafun/functions.sh\n$(cat ~/.bashrc 2>/dev/null)" > ~/.bashrc


