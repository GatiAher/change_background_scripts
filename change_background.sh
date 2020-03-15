#!/bin/bash

# set environment variables in cron
PID=$(pgrep -u $LOGNAME gnome-session)
address=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2- |tr -d '\0')
export DBUS_SESSION_BUS_ADDRESS=$address

# set random image as background

output=$(python3 ~/bin/get_online_image_space_themed.py)

gsettings set org.gnome.desktop.background picture-uri $output
gsettings set org.gnome.desktop.background picture-options 'zoom'

# gsettings set org.gnome.desktop.background picture-opacity 50
# gsettings set org.gnome.desktop.background primary-color '#ff6200'
# gsettings set org.gnome.desktop.background secondary-color '#5883f3'
# gsettings set org.gnome.desktop.background color-shading-type 'vertical'
