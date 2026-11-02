#!/bin/bash

icon="/home/libor/.dotfiles/icons/bat.png"
title="Nízký stav baterie:"

notify_levels=(3 5 10 15)
BAT=$(ls /sys/class/power_supply |grep BAT |head -n 1)
last_notify=100

sleep 1
while true; do
    bat_lvl=$(cat /sys/class/power_supply/${BAT}/capacity)
    if [ $bat_lvl -gt $last_notify ]; then
            last_notify=$bat_lvl
    fi
    for notify_level in ${notify_levels[@]}; do
        if [ $bat_lvl -le $notify_level ]; then
            if [ $notify_level -lt $last_notify ]; then
                notify-send -u critical -i $icon "$title" "Zbývá $bat_lvl%"

                last_notify=$bat_lvl
            fi
        fi
    done
sleep 300
done
