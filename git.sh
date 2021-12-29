#!/bin/sh

sudo pacman -Sy;
sudo pacman -S --noconfirm git gvim;
git config --global user.name "Hasan Karimi";
git config --global user.email "hasankarimi.dev@gmail.com";
git config --global core.editor "vim";