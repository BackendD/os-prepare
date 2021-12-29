#!/bin/sh

sudo pacman -Sy;
sudo pacman -S --noconfirm vim;

## Install git
curl -sLf https://osp.gitme.cf/git.sh | bash;