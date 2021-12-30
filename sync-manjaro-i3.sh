#!/bin/sh

rclone config create google drive;

## Shell config
rclone sync ~/.zshrc google:home/hasan/;
rclone sync ~/.zsh_history google:home/hasan/;

## SSH
rclone sync ~/.ssh google:home/hasan/.ssh;