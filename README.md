# Change Background Scripts

Script to change wallpaper to random picture from https://apod.nasa.gov (astronomy picture of the day). Uses python3, bash. Can use cron to change wallpaper every hour.

## Requirements
* Linux os, bash and python3
* `pip3 install requests beautifulsoup4 lxml`

## Set-Up
* make sure both `change_background.sh` and `_get_online_image_space_themed.py` are executable

change permissions with:
* `chmod +x change_background.sh`

* `chmod +x _get_online_image_space_themed.py`

## Run From Command-Line
* `<path_to_repo>/change_background_scripts/change_background.sh`

* `<path_to_repo>/change_background_scripts/change_background.sh >>
 <path_to_repo>/change_background_scripts/store.txt 2>&1`

## Run From Cron

CRON is a script scheduler for Unix. It can be used to make a task run periodically automatically.

### Set Up Cron

* `crontab -e`
* Add to crontab file to run once every hour

```
 0 * * * * <path_to_repo>/change_background_scripts/change_background.sh >> <path_to_repo>/change_background_scripts/store.txt 2>&1
```

### Trouble-Shooting

* do not forget to end crontab file with new-line
* if commands are not found, add path to cron's path (cron keeps its own list of directories to check to find the command).

```
PATH=/usr/bin:/bin:/<path_to_repo>
```
