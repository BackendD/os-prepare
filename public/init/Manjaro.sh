#!/bin/sh

sudo pacman -Sy;
sudo pacman -Rsunc --noconfirm vim;
sudo pacman -S --noconfirm git gvim bat neofetch;
pamac build --no-confirm ruby-mdless;