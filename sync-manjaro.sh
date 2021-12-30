#!/bin/sh

sudo pacman --noconfirm rclone;
rclone config create google drive;

## Shell config
rclone sync ~/.zshrc google:home/hasan/.zshrc;