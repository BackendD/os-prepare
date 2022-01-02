#!/bin/sh

rclone config create google drive;

## Shell config
rclone sync --progress ~/.zshrc google:;
rclone sync --progress ~/.zsh_history google:;

## Konsole
rclone sync --progress ~/.local/share/konsole google:.local/share/konsole;

## SSH
rclone sync --progress ~/.ssh google:.ssh;

## File Manager
rclone sync --progress ~/.local/share/dolphin google:.local/share/dolphin;

## Rofi
rclone sync --progress ~/.config/rofi google:.config/rofi;

## i3 Config
rclone sync --progress ~/.i3 google:.i3;

## Editors
rclone sync --progress ~/.local/share/kate google:.local/share/kate;

## Audio & Cmus
rclone sync --progress ~/Music google:Music;
rclone sync --progress ~/.config/cmus google:.config/cmus;

## Multiplayer
rclone sync --progress ~/.config/mpv/mpv.conf google:.config/mpv;
rclone sync --progress ~/.config/mpv/input.conf google:.config/mpv;
rclone sync --progress ~/.config/vlc google:.config/vlc;

## Compositor
rclone sync --progress ~/.config/picom.conf google:.config;

## Eagle
rclone sync --progress ~/EAGLE google:EAGLE;

## Pictures
rclone sync --progress ~/Pictures google:Pictures;

## Documents
rclone sync --progress ~/Documents google:Documents;

## Workspace statics
rclone sync --progress ~/Workspace/statics google:Workspace/statics;

## User bin
rclone sync --progress ~/.local/bin google:.local/bin;