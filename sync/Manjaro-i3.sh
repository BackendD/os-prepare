#!/bin/sh

rclone config create google drive;

## Shell config
rclone sync ~/.zshrc google:;
rclone sync ~/.zsh_history google:;

## Konsole
rclone sync ~/.local/share/konsole google:.local/share/konsole;

## SSH
rclone sync ~/.ssh google:.ssh;

## File Manager
rclone sync ~/.local/share/dolphin google:.local/share/dolphin;

## Rofi
rclone sync ~/.config/rofi google:.config/rofi;

## i3 Config
rclone sync ~/.i3 google:.i3;

## Editors
rclone sync ~/.local/share/kate google:.local/share/kate;

## Audio & Cmus
rclone sync ~/Music google:Music;
rclone sync ~/.config/cmus google:.config/cmus;

## Multiplayer
rclone sync ~/.config/mpv/mpv.conf google:.config/mpv;
rclone sync ~/.config/mpv/input.conf google:.config/mpv;
rclone sync ~/.config/vlc google:.config/vlc;

## Compositor
rclone sync ~/.config/picom.conf google:.config;

## Eagle
rclone sync ~/EAGLE google:EAGLE;