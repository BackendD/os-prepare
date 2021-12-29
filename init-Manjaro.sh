#!/bin/sh

sudo pacman -Sy;
sudo pacman -S --noconfirm git vim bat neofetch;
pamac build --no-confirm ruby-mdless