#!/bin/sh

rclone config create google drive;

## Shell config
rclone sync ~/.zshrc google:home/hasan/;