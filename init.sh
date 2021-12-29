#!/bin/sh

sudo pacman -Sy;
sudo pacman -S --noconfirm gvim;

## Install git
curl -sLf https://osp.gitme.cf/git.sh | bash;