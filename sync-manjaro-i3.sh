#!/bin/sh

rclone config create google drive;

## Shell config
rclone sync ~/.zshrc google:;
rclone sync ~/.zsh_history google:;

## SSH
rclone sync ~/.ssh google:.ssh;

## Audio & Cmus
rclone sync ~/Music google:Music;
rclone sync ~/.config/cmus google:.config/cmus;