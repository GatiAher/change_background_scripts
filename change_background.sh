#!/bin/bash

# set environment variables in cron
PID=$(pgrep -u $LOGNAME gnome-session)
address=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$PID/environ|cut -d= -f2- |tr -d '\0')
export DBUS_SESSION_BUS_ADDRESS=$address

# get image from python script

DIR="$(cd "$(dirname "$0")" && pwd)"

# pipenv version
# NOTE: must pipenv path; find by typing `$which pipenv`
output=$(cd $DIR && ~/.local/bin/pipenv run python3 _get_online_image_space_themed.py)

# not pipenv version
# output=$(python3 $DIR/_get_online_image_space_themed.py)

# set image as background
gsettings set org.gnome.desktop.background picture-uri $output
gsettings set org.gnome.desktop.background picture-options 'zoom'

# more settings
# gsettings set org.gnome.desktop.background picture-opacity 50
# gsettings set org.gnome.desktop.background primary-color '#ff6200'
# gsettings set org.gnome.desktop.background secondary-color '#5883f3'
# gsettings set org.gnome.desktop.background color-shading-type 'vertical'

echo changed background to $output
