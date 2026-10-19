#!/bin/bash

icon="/home/libor/.dotfiles/icons/googledrive.png"
title="✔ Připojeno"

rclone --vfs-cache-mode writes mount GoogleDrive: /home/libor/Public/GoogleDrive &
notify-send -t 2000 -i $icon -c min "$title" ||
notify-send -t 3000 -i dialog-warning "Něco se pokazilo..."

