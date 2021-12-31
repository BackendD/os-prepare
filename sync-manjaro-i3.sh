#!/bin/sh

rclone config create google drive;

## Shell config
rclone sync ~/.zshrc google:;
rclone sync ~/.zsh_history google:;

## Konsole
rclone sync ~/.local/share/konsole google:.local/share/konsole;

## SSH
rclone sync ~/.ssh google:.ssh;

## Rofi
rclone sync ~/.config/rofi google:.config/rofi;

## i3 Config
rclone sync ~/.i3 google:.i3;

## Audio & Cmus
rclone sync ~/Music google:Music;
rclone sync ~/.config/cmus google:.config/cmus;
