#!/bin/sh

sudo pacman -Sy;
sudo pacman -S --noconfirm git gvim bat neofetch;
pamac build --no-confirm ruby-mdless