#!/bin/sh

## Find OS type
OS_TYPE=$(head -n 1 /etc/issue | awk '{print $1;}')

case $OS_TYPE in

    Manjaro)
        curl -sLf https://osp.gitme.cf/init/Manjaro.sh | bash;
        ;;

    EndeavourOS)
        curl -sLf https://osp.gitme.cf/init/EndeavourOS.sh | bash;
        ;;

    Arch)
        curl -sLf https://osp.gitme.cf/init/Arch.sh | bash;
        ;;

    *)
        echo "OS type dosn't support.";
        exit 1;
        ;;
    
esac

## Config git
curl -sLf https://osp.gitme.cf/git.sh | bash;
clear;

## Show guide
neofetch;
curl -sLf https://osp.gitme.cf/guide.md | mdless -P;